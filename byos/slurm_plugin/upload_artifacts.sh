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
set -ex

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

S3_BUCKET=${1}

aws s3 cp ./slurm_plugin_infrastructure.cfn.yaml "s3://${S3_BUCKET}/byos/slurm_plugin_infrastructure.cfn.yaml"

git archive --format=tar --output=slurm_plugin_cookbook.tar.gz HEAD slurm_plugin_cookbook
aws s3 cp ./slurm_plugin_cookbook.tar.gz "s3://${S3_BUCKET}/byos/slurm_plugin_cookbook.tar.gz"

git archive --format=tar --output=artifacts.tar.gz HEAD artifacts
aws s3 cp ./artifacts.tar.gz "s3://${S3_BUCKET}/byos/artifacts.tar.gz"
