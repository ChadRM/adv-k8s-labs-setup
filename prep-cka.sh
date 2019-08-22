./get_files.sh
./create_inv.sh
export STARTED="`date`"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Prepping CKA Class labs...."
echo "========================Tidying up..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml pre-class-tidy.yaml
echo "========================Install K9s Client..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-k9s.yaml
echo "========================Done!"
echo "Started at $STARTED"
echo "Ended at $(date)"
