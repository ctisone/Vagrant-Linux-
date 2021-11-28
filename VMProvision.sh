#!/bin/bash
# We will want to update APT repositories via the add-apt-repository Python script,
# so make sure the script is installed by installing software-properties-common
sudo apt-get install -y software-properties-common=0.99.9.8
#
# APT repositories to add 
#
sudo add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#
# Do a general system update
#
sudo apt-get update
#
# Start updating packages we want in the installation.  All installations are specifically versioned
# for two reasons:
#       1) They can affect bitwise software build reproducibility (e.g. compilers, make tools, etc.)
#       2) They can affect system stability due to problems in the packages themselves (see python3-apt issue below) 
#
# Useful standard tools and utilities to install.
#
sudo apt-get install -y apt-show-versions=0.22.11
sudo apt-get install -y tree=1.8.0-1
#
# Python3 support
#
sudo apt-get install -y python3.9=3.9.9-1+focal2
sudo apt-get install -y python3-pip=20.0.2-5ubuntu1.6
sudo apt-get install -y python3.9-dev=3.9.9-1+focal2
sudo apt-get install -y libpython3.9-dev=3.9.9-1+focal2
#
# Python packages
#
pip install pyinstaller
#
# General softare development
#
sudo apt-get install -y build-essential=12.8ubuntu1.1
sudo apt-get install -y cmake=3.16.3-1ubuntu1
sudo apt-get install -y gcc-11=11.1.0-1ubuntu1~20.04
sudo apt-get install -y g++-11=11.1.0-1ubuntu1~20.04 
#
# Post installation maintenance
#
# Upgrading Python can cause an error to appear from time to time: ModuleNotFoundError: No module named 'apt_pkg'
# This was resolved by removing and reinstalling python3-apt per the following link:
# https://unix.stackexchange.com/questions/588066/modulenotfounderror-no-module-named-apt-pkg-appears-in-various-commands
sudo apt-get remove -y python3-apt
sudo apt-get install -y python3-apt=2.0.0ubuntu0.20.04.6
#
# General cleanup
#
sudo apt-get -y autoremove
sudo apt-get -y autoclean
#
# Delete the present Python3 soft link and point it at the Python version just installed
#
sudo rm /usr/bin/python3
sudo ln -s /usr/bin/python3.9 /usr/bin/python3
#
# System settings
#
sudo timedatectl set-ntp true
#
# Update path
#
export PATH=$PATH:~/.local/bin
