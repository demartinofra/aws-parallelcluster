# frozen_string_literal: true

# Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance
# with the License. A copy of the License is located at http://aws.amazon.com/apache2.0/
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

require 'chef/mixin/shell_out'

#
# Retrieve compute nodename from file (HIT only)
#
def hit_slurm_nodename
  slurm_nodename_file = "#{node['byos']['shared_dir']}/slurm_nodename"

  IO.read(slurm_nodename_file).chomp
end

#
# Retrieve compute and head node info from dynamo db (Slurm only)
#
def hit_dynamodb_info
  require 'chef/mixin/shell_out'

  output = shell_out!("aws dynamodb " \
                      "--region #{node['byos']['region']} query --table-name #{node['cluster']['ddb_table']} " \
                      "--index-name InstanceId --key-condition-expression 'InstanceId = :instanceid' " \
                      "--expression-attribute-values '{\":instanceid\": {\"S\":\"#{node['ec2']['instance_id']}\"}}' " \
                      "--projection-expression 'Id' " \
                      "--output text --query 'Items[0].[Id.S]'", user: 'root').stdout.strip

  raise "Failed when retrieving Compute info from DynamoDB" if output == "None"

  slurm_nodename = output

  Chef::Log.info("Retrieved Slurm nodename is: #{slurm_nodename}")

  slurm_nodename
end

#
# Verify if a given node name is a static node or a dynamic one (HIT only)
#
def hit_is_static_node?(nodename)
  match = nodename.match(/^([a-z0-9\-]+)-(st|dy)-([a-z0-9\-]+)-\d+$/)
  raise "Failed when parsing Compute nodename: #{nodename}" if match.nil?

  match[2] == "st"
end

def setup_munge_head_node
  # Generate munge key
  bash 'generate_munge_key' do
    user node['munge']['user']
    group node['munge']['group']
    cwd '/tmp'
    code <<-HEAD_CREATE_MUNGE_KEY
      set -ex
      # Generates munge key in /etc/munge/munge.key
      /usr/sbin/mungekey --verbose
      # Enforce correct permission on the key
      chmod 0600 /etc/munge/munge.key
    HEAD_CREATE_MUNGE_KEY
  end

  enable_munge_service
  share_munge_head_node
end

def share_munge_head_node
  # Share munge key
  bash 'share_munge_key' do
    user 'root'
    group 'root'
    code <<-HEAD_SHARE_MUNGE_KEY
      set -e
      mkdir #{node['byos']['shared_dir']}/.munge
      # Copy key to shared dir
      cp /etc/munge/munge.key  #{node['byos']['shared_dir']}/.munge/.munge.key
    HEAD_SHARE_MUNGE_KEY
  end
end

def setup_munge_compute_node
  # Get munge key
  bash 'get_munge_key' do
    user 'root'
    group 'root'
    code <<-COMPUTE_MUNGE_KEY
      set -e
      # Copy munge key from shared dir
      cp  #{node['byos']['shared_dir']}/.munge/.munge.key /etc/munge/munge.key
      # Set ownership on the key
      chown #{node['munge']['user']}:#{node['munge']['group']} /etc/munge/munge.key
      # Enforce correct permission on the key
      chmod 0600 /etc/munge/munge.key
    COMPUTE_MUNGE_KEY
  end

  enable_munge_service
end

def enable_munge_service
  service "munge" do
    supports restart: true
    action %i[enable start]
  end
end

#
# Check if Nvidia driver is installed
#
def nvidia_installed?
  nvidia_installed = ::File.exist?('/usr/bin/nvidia-smi')
  Chef::Log.warn("Nvidia driver is not installed") unless nvidia_installed
  nvidia_installed
end
