apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
apt install -y docker.io
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install -y kubelet kubeadm kubectl
cat << EOF > /etc/kubernetes/aws.yaml
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
networking:
  serviceSubnet: "10.100.0.0/16"
  podSubnet: "10.244.0.0/16"
apiServer:
  extraArgs:
    cloud-provider: "aws"
controllerManager:
  extraArgs:
    cloud-provider: "aws"
EOF

history
sudo apt install -y kubelet=1.22.4-00 kubeadm=1.22.4-00 kubectl=1.22.4-00
sudo apt install -y kubelet=1.22.4-00 kubeadm=1.22.4-00 kubectl=1.22.4-00 --allow-downgrades
vi /etc/kubernetes/aws.yaml
kubeadm init --config /etc/kubernetes/aws.yaml
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
kubectl get nodes
hostname -f
apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
apt install -y docker.io
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
sudo apt install -y kubelet=1.22.4-00 kubeadm=1.22.4-00 kubectl=1.22.4-00
sudo apt install -y kubelet=1.22.4-00 kubeadm=1.22.4-00 kubectl=1.22.4-00 --allow-downgrade
sudo apt install -y kubelet=1.22.4-00 kubeadm=1.22.4-00 kubectl=1.22.4-00 --allow-downgrades
cat << EOF > /etc/kubernetes/node.yml
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: JoinConfiguration
discovery:
  bootstrapToken:
    token: "f3369a.plpwut4jgb5wtrqc"
    apiServerEndpoint: "10.0.0.181:6443"
    caCertHashes:
      - "sha256:1cfb2bc962beaa53cc5fb3464e0e6821f558e3c44e522c245c1841a8526f93f8"
nodeRegistration:
  name: ip-10-0-0-181.ec2.internal
  kubeletExtraArgs:
    cloud-provider: aws
EOF

kubeadm join --config /etc/kubernetes/node.yml
vi /etc/kubernetes/node.yml
kubeadm join --config /etc/kubernetes/aws.yaml --ignore-preflight-errors=NumCPU
kubeadm join --config /etc/kubernetes/node.yml --ignore-preflight-errors=NumCPU
kubectl get nodes
vi tomcat.yaml
kubectl create -f tomcat.yaml
vi tomcat.yaml
kubectl create -f tomcat.yaml
ls
kubectl get pods
kubectl get pods -owide
kubectl get pods tomcat -oyaml
vi tomcat.yaml 
kubectl delete pod tomcat
vi tomcat.yaml 
kubectl create -f tomcat.yaml
kubectl get pods
kubectl get pods -owide
vi clusternetwork.yaml
kubectl create -f clusternetwork.yaml
kubectl get service
kubectl get svc
kubectl get endpionts
kubectl get endpiont
kubectl get endpoints
vi nodeport.yml
kubectl create -f nodeport.yml 
kubectl get ports
kubectl get pod
kubectl delete pod multihost
kubectl get service
cat nodeport.yml 
kubectl get endpionts
kubectl get --help
kubectl get endpiont
ls
vi nodeport.yml 
vi loadbal.yml
kubectl apply -f loadbal.yml 
kubectl get service
kubectl get pods -owide
curl -v 10.100.75.46:8094
curl -v 10.100.75.46:31336
ls
vi nodeport.yml 
kubectl apply -f .yml 
vi nodeport.yml 
kubectl get service
kubectl describe svc LoadBalancer 
ls
vi loadbal.yml 
kubectl describe svc tomcat-loadbal
ls
vi nodeport
vi nodeport.yml 
kubectl apply -t nodeport.yml 
kubectl apply -f nodeport.yml 
kubectl get pods
kubectl get svc
kubectl get endpiionts
kubectl get endpoints
kubectl get nodes
vi nodeport.yml 
ls
vi tomcat.yaml 
kubectl apply -f tomcat.yaml 
kubectl get svc
kubectl get pods
kubectl get endpoints
kubectl get svc
kubectl describe svc tomcat-loadbal
kubectl get svc
vi loadbal.yml 
kubectl get svc
kubectl get ep
kubectl edit svc tomcat-loadbal
vi loadbal.yml 
kubectl apply -f loadbal.yml 
kubectl get svc
vi loadbal.yml 
kubectl apply -f loadbal.yml 
kubectl get svc
kubectl get ep
vi loadbal.yml 
ls
mkdir gitkube
cp -R . gitkube/
cp -R . gitkube
cd gitkube/
ls
rm -rf gitkube
git init
git remote add https://github.com/Srikanthkittane/kubernetes.git
git remote add origin https://github.com/Srikanthkittane/kubernetes.git
git add .
git commit -m "this is the first push"
git push origin 
git push origin master
ls
