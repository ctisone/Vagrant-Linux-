# Vagrant (Linux)

This project contains the files required to create and provision a Vagrant virtual machine running Linux.  Before running the initial *vagrant up* command, the following prerequisites must be installed:

- [Hashicorp Vagrant](https://www.vagrantup.com/downloads)
- A virtual machine hosting environment.  This installation was tested using [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)

# Quick Start
- Download and install the noted prerequisites
- Download this project into a host directory
- Using a command prompt, navigate to the project directory and run the *vagrant up* command.  This will create the virtual machine and run the *VagrantProvision* bash script to provision it.
- When the installation completes, enter the *vagrant ssh-config* to obtain the SSH parameters needed to connect to the virtual machine

The virtual machine is now running and ready for use.

# Visual Studio Code
To seamlessly use the virtual machine with Visual Studio code, a few more steps are required:

- Install a Visual Studio Code SSH plugin.  This was tested with the Microsoft *ms-vscode-remote.remote-ssh* plugin
- Run Visual Studio Code and click the remote SSH status bar at the lower left corner of the window
<p align="center">
<img src="Images/SSHStatusBar.png">
</p>

- When the SSH menu appears, click *Open SSH Configuration File...*
- Select the SSH config file located in your user path (e.g. *C:\Users\<YourUserName>\.ssh\config*
- When the SSH config file opens, paste the previously obtained SSH information into it
- On the first line that reads *Host default*, *default* is the current alias of the SSH host (in this case, the remote host a vagrant virtual machine) that Visual Studio Code uses to identify an SSH connection. Change this to something that specifically identifies this SSH host, as it is likely you will have multiple virtual machines in the future and you will need to be able to differentiate them.
- Save and close the config file

# Supported Development Environments
Virtual machines created from this project are explicitly configured to support the following development environments:

- Python 3.9 (PIP)

The base box may by default support other environments (e.g. C, C++, Python 2, etc.), but those are not explicitly controlled by the provisioning process.
