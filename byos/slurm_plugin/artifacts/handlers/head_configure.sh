#!/bin/bash

#
# Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance
# with the License. A copy of the License is located at http://aws.amazon.com/apache2.0/
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

echo "Handling event: HeadConfigure"

# TODO: remove once this is provided out of the box by byos
echo "Activating python virutualenv"
source  /home/byos/.pyenv/versions/3.9.7/envs/byos/bin/activate

# TODO: remove once ClusterSharedArtifacts is available
aws s3 cp s3://cfncluster-fdm-build-artifacts-eu-west-1/byos/slurm_plugin_cookbook.tar.gz .
rm -rf cookbooks && mkdir cookbooks
tar -xf slurm_plugin_cookbook.tar.gz -C cookbooks
chef-client -z -o slurm_plugin_cookbook::slurm_install --log-level info


