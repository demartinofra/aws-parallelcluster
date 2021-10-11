# Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance
# with the License. A copy of the License is located at http://aws.amazon.com/apache2.0/
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.
require 'yaml'
require 'json'

default['byos']['cluster_name'] = ENV['PCLUSTER_CLUSTER_NAME']
default['byos']['local_dir'] = ENV['PCLUSTER_LOCAL_SCHEDULER_DIR']
default['byos']['shared_dir'] = ENV['PCLUSTER_SHARED_SCHEDULER_DIR']
default['byos']['region'] = ENV['PCLUSTER_REGION']
default['byos']['cluster_config_path'] = ENV['PCLUSTER_CLUSTER_CONFIG']
default['byos']['cluster_config'] = YAML.load_file(node['byos']['cluster_config_path'])
default['byos']['launch_templates_config_path'] = ENV['PCLUSTER_LAUNCH_TEMPLATES']
default['byos']['launch_templates_config'] = JSON.load_file(node['byos']['launch_templates_config_path'])
default['byos']['cfn_stack_outputs_file'] = ENV['PCLUSTER_BYOS_CFN_SUBSTACK_OUTPUTS']
default['byos']['cfn_stack_outputs'] = JSON.load_file(node['byos']['cfn_stack_outputs_file']) unless node['byos']['cfn_stack_outputs_file'].nil?
default['byos']['instance_types_data_path'] = ENV['PCLUSTER_INSTANCE_TYPES_DATA']

default['slurm']['version'] = '20-11-8-1'
default['slurm']['url'] = "https://github.com/SchedMD/slurm/archive/slurm-#{node['slurm']['version']}.tar.gz"
default['slurm']['sha1'] = 'bc91a25355400f85ece1a204121591e6a2424617'
default['slurm']['user'] = 'slurm'
default['slurm']['group'] = node['slurm']['user']
default['slurm']['install_dir'] = "#{node['byos']['shared_dir']}/slurm"

default['munge']['user'] = 'munge'
default['munge']['group'] = node['munge']['user']

default['python']['virtualenv_path'] = '.pyenv/versions/byos/'
