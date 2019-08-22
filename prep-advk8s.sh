./get_files.sh
./create_inv.sh
export STARTED="`date`"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Prepping Advanced K8s Class..."
echo "========================Tidying up..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml pre-class-tidy.yaml
echo "========================Install K9s Client..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-k9s.yaml
echo "========================Install KUDO plugin binary..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-kudo-plugin.yaml
echo "========================Done!"
echo "Started at $STARTED"
echo "Ended at $(date)"
