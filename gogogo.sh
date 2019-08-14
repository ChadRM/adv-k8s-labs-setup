./get_files.sh
./create_inv.sh
export STARTED="`date`"
echo "========================Tidying up..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml pre-class-tidy.yaml
echo "========================Install K8s..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-k8s.yaml
echo "========================Install K9s Client..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-k9s.yaml
echo "========================Install Traefik Ingress Controller..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-traefik.yaml
echo "========================Install Dynamic NFS PV Provisioner..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-dnfs.yaml
echo "========================Install KUDO..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-kudo.yaml
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-kudo-plugin.yaml
echo "========================Install Helm..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-helm.yaml
echo "========================Install Istio..."
ansible-playbook --key-file=student_key -i ./inventory/inv.yaml install-istio.yaml
echo "========================Done!"
echo "Started at $STARTED"
echo "Ended at $(date)"
