# adv-k8s-labs-setup
A set of ansible scripts dealing primarily with D2iQ's Advanced Kubernetes 
course class labs.

Takes input from Devin's Education Toolbox inventories and transforms them
into an Ansible-read YAML inventory files with necessary groups and variables.

./set-k8s-adv.sh Sets up the student clusters by
* Tidying up the student's home directories
* Building the KUDO plugin on only one of the masters
* Installing the KUDO plugin on all masters

At this point, the student clusters should be ready for use in the class.


./gogogo.sh fast-forwards all lab machines to the end state of the class
by configuring and installing everything we go through in class.  No class
exercise YAML is included, but anything needed to do the installs is
left behind in appropriate directories in the home directory.
