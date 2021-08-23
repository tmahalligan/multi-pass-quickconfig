
This repo will ease the setup of Carvel test Ubuntu envirionment. This repo is to be used in conjuntion with a Multipass Ubuntu install 

### Requirements: ###
git installed locally 

### Install Multipass ###
MAC: https://multipass.run/docs/installing-on-macos
Windows: https://multipass.run/docs/installing-on-windows
Linux: https://multipass.run/docs/installing-on-linux

### Pull down config automation ###
Create a local directory to pull the multipass_config repo and clone repo

mkdir /projects/demo

cd /projects/demo

git clone https://github.com/tmahalligan/multi-pass-quickconfig.git

### Launch Multipass instance ####
Launch arguments
-d (Disk space) -m (Memory) -c (cpu) -n (Name) and final argument is image version. Adjust according to your needs (For minikube to function 2 cpu must be allocated )

multipass launch -d 10G -m 2G -c 2 -n utest 20.04

### Mount the config automation (You must use full path)
multipass mount /Users/thalligan/projects/demo/multipass_config utest

### Shell in and run automation (A number of tools will be installed run may take a number of minutes)
multipass shell utest
cd /Users/thalligan/projects/demo/multipass_config
bash setup.sh. (This will take awhile)

#### Exit shell and remove mount
multipass unmount utest

### Remove
multipass delete utest
multipass purge