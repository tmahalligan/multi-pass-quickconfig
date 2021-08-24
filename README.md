
This repo will ease the setup of Carvel test Ubuntu envirionment. This repo is to be used in conjuntion with a Multipass Ubuntu install 

### Requirements: ###
git installed locally 

### Install Multipass ###
MAC: https://multipass.run/docs/installing-on-macos
Windows: https://multipass.run/docs/installing-on-windows
Linux: https://multipass.run/docs/installing-on-linux

### Pull down config automation ###
Create a local directory to pull the multipass_config repo and clone repo

mkdir /Users/username/projects/demo

cd /Users/username/projects/demo

git clone https://github.com/tmahalligan/multi-pass-quickconfig.git

### Launch Multipass instance with minikube ####
Launch arguments
-d (Disk space) -m (Memory) -c (cpu) -n (Name) and final argument is image version. Adjust according to your needs (For minikube to function 2 cpu must be allocated )

multipass launch -d 40G -m 4G -c 3 -n utest minikube

### Mount the config automation (You must use full path)
multipass mount /Users/username/projects/demo/multi-pass-quickconfig utest

### Shell in and run automation (A number of tools will be installed run may take a number of minutes)
multipass shell utest
cd /Users/thalligan/projects/demo/multi-pass-quickconfig
bash setup.sh. (This will take awhile)

#### Exit shell and remove mount
multipass unmount utest

### Remove
multipass delete utest
multipass purge