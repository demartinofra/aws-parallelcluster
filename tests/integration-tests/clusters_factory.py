# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied.
# See the License for the specific language governing permissions and limitations under the License.
import logging

import configparser
from retrying import retry

from utils import retrieve_cfn_outputs, retry_if_subprocess_error, run_command


class Cluster:
    """Contain all static and dynamic data related to a cluster instance."""

    def __init__(self, name, config_file, ssh_key):
        self.name = name
        self.config_file = config_file
        self.ssh_key = ssh_key
        self.config = configparser.ConfigParser()
        self.config.read(config_file)
        self.__cfn_outputs = None

    @property
    def cfn_name(self):
        """Return the name of the CloudFormation stack associated to the cluster."""
        return "parallelcluster-" + self.name

    @property
    def region(self):
        """Return the aws region the cluster is created in."""
        return self.config.get("aws", "aws_region_name", fallback="us-east-1")

    @property
    def master_ip(self):
        """Return the public ip of the cluster master node."""
        return self.cfn_outputs["MasterPublicIP"]

    @property
    def os(self):
        """Return the os used for the cluster."""
        cluster_template = self.config.get("global", "cluster_template", fallback="default")
        return self.config.get("cluster {0}".format(cluster_template), "base_os", fallback="alinux")

    @property
    def cfn_outputs(self):
        """
        Return the CloudFormation stack outputs for the cluster.
        Outputs are retrieved only once and then cached.
        """
        if self.__cfn_outputs:
            return self.__cfn_outputs
        self.__cfn_outputs = retrieve_cfn_outputs(self.cfn_name, self.region)
        return self.__cfn_outputs


class ClustersFactory:
    """Manage creation and destruction of pcluster clusters."""

    def __init__(self):
        self.__created_clusters = {}

    def create_cluster(self, cluster):
        """
        Create a cluster with a given config.
        :param cluster: cluster to create.
        """
        name = cluster.name
        config = cluster.config_file
        if name in self.__created_clusters:
            raise ValueError("Cluster {0} already exists".format(name))

        # create the cluster
        logging.info("Creating cluster {0} with config {1}".format(name, config))
        self.__created_clusters[name] = cluster
        result = run_command(["pcluster", "create", "--config", config, name])
        if "CREATE_COMPLETE" not in result.stdout:
            error = "Cluster creation failed for {0} with output: {1}".format(name, result.stdout)
            logging.error(error)
            raise Exception(error)
        logging.info("Cluster {0} created successfully".format(name))

    @retry(stop_max_attempt_number=10, wait_fixed=5000, retry_on_exception=retry_if_subprocess_error)
    def destroy_cluster(self, name):
        """Destroy a created cluster."""
        logging.info("Destroying cluster {0}".format(name))
        if name in self.__created_clusters:
            cluster = self.__created_clusters[name]

            # destroy the cluster
            result = run_command(["pcluster", "delete", "--config", cluster.config_file, name])
            if "DELETE_FAILED" in result.stdout:
                error = "Cluster deletion failed for {0} with output: {1}".format(name, result.stdout)
                logging.error(error)
                raise Exception(error)
            del self.__created_clusters[name]
            logging.info("Cluster {0} deleted successfully".format(name))
        else:
            logging.warning("Couldn't find cluster with name {0}. Skipping deletion.".format(name))

    def destroy_all_clusters(self):
        """Destroy all created clusters."""
        logging.debug("Destroying all clusters")
        for key in list(self.__created_clusters.keys()):
            try:
                self.destroy_cluster(key)
            except Exception as e:
                logging.error("Failed when destroying cluster {0} with exception {1}.".format(key, e))