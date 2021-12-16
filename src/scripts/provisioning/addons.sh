#!/bin/bash
cat << EOF >> ~/.bash_profile
export PATH="/root/bin:~/.kubectx:\$PATH"
EOF

echo "Create local directory for binaries - FlatCar Container"
mkdir ~/bin

source ~/.bash_profile

echo "HELM Installation"
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 -o /tmp/get_helm.sh
chmod +x /tmp/get_helm.sh
sed -i 's#/usr/local/bin#/root/bin#g' /tmp/get_helm.sh
/tmp/get_helm.sh

echo "K3D Installation"
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh -o /tmp/k3d_install.sh
chmod +x /tmp/k3d_install.sh
sed -i 's#/usr/local/bin#/root/bin#g' /tmp/k3d_install.sh
/tmp/k3d_install.sh

echo "Kubectl installation"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
install -o root -g root -m 0755 kubectl ~/bin/kubectl
kubectl version --client

echo "Kubectx & Kubens installation"
git clone https://github.com/ahmetb/kubectx ~/opt/kubectx
git clone https://github.com/ahmetb/kubectx.git ~/.kubectx

rm -rf /tmp/get_helm.sh /tmp/k3d_install.sh ~/kubectl ~/kubectl.sha256

echo "Installing Istio latest"


exit 0