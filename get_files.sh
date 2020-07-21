#!/bin/sh
rm inventory/*
scp chad@10.9.185.107:/home/chad/meso-edu3/education-toolbox/education-toolbox/envctl/student_key .
chmod 600 student_key
scp chad@10.9.185.107:/home/chad/meso-edu3/education-toolbox/education-toolbox/envctl/inventory/dist/* ./inventory/
cat ./inventory/* > ./inventory/inv.concat
#rm ./inventory/dc*.txt
#parse this shit in python
#sh ./create_inv.sh
#echo "Now run ./create_inv.sh and then ->"
#echo "ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-k8s.yaml"
