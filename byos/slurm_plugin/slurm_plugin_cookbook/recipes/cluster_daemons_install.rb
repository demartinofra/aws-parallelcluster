# frozen_string_literal: true

#
# Cookbook Name:: slurm_plugin_cookbook
# Recipe:: cluster_daemons_install
#
# Copyright 2013-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

# Install Slurm
bash 'install' do
  user node['plugin']['user']
  group node['plugin']['user']
  code <<-DAEMONS
    set -e
    #{node['python']['virtualenv_path']}/bin/pip install aws-parallelcluster-node
  DAEMONS
  not_if "#{node['python']['virtualenv_path']}/bin/pip list | grep aws-parallelcluster-node"
end
