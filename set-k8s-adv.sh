./get_files.sh
./create_inv.sh
export STARTED="`date`"
echo "========================Tidying up..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml pre-class-tidy.yaml
#echo "========================Install Build Kudo plugin..."
#ansible-playbook --key-file=student_key -i ./inventory/inv.yaml build-kudo-kubectl-plugin.yaml
echo "========================Install Kudo plugin..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-kudo-plugin.yaml
echo "========================Done!"
echo "Started at $STARTED"
echo "Ended at $(date)"
