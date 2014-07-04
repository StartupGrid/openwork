#!/usr/bin/env bash

source functions.sh
check_root

####
# Creating folder structure
mkdir -p /StartupGrid/hadoop/mapper /StartupGrid/hadoop/reducer /StartupGrid/hadoop/data
chmod -R 775 /StartupGrid
####

####
# Adding mapper and reducer scripts
cp ../python/mapper.py /StartupGrid/hadoop/mapper/mapper.py
cp ../python/reducer.py /StartupGrid/hadoop/reducer/reducer.py
####

####
# Adding links for easier use
cd /StartupGrid/hadoop
ln -s mapper/mapper.py" mapper.py
ln -s reducer/reducer.py" reducer.py
####
