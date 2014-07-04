#!/usr/bin/env bash

source functions.sh
check_root

####
# Downloading Hadoop tar
#    Move download to data node late
echo "Installing Hadoop in m"
cd 

# Using 1.2.* for now
#curl -o hadoop.tar.gz http://mirror.metrocast.net/apache/hadoop/common/stable2/hadoop-2.2.0.tar.gz
curl -o hadoop.tar.gz http://apache.claz.org/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz
tar -xf hadoop.tar.gz



####
