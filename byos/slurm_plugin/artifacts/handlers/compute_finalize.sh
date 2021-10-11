#!/bin/bash

set -e

echo "Handling event: ComputeFinalize"
env

tar -xf artifacts.tar.gz
rm -rf cookbooks && mkdir cookbooks
tar -xf slurm_plugin_cookbook.tar.gz -C cookbooks
export NODE_TYPE=ComputeFleet
sudo -E cinc-client -z -o slurm_plugin_cookbook::compute_finalize --log-level info --force-formatter
