
# We will want to update APT repositories via the add-apt-repository Python script,
# so make sure the script is installed by installing software-properties-common
sudo apt-get update
sudo apt install -y software-properties-common

# APT repositories to add 
sudo add-apt-repository ppa:deadsnakes/ppa

# Software to install
sudo apt install -y python3.9
sudo apt install -y python-pip

# Maintenance
#
# Delete the Python3 soft link and point it at the Python version just installed
sudo rm /usr/bin/python3
sudo ln -s /usr/bin/python3.9 /usr/bin/python3

