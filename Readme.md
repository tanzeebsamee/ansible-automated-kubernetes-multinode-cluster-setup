# Multi Master kubernetes setup playbook



## Prerequisites | Important

Modify inventory/mycluster based on your need. Definition/usages written at `usage` part.
## Installation

Guide to use this playbook in below sequence once `inventory/mycluster` is changed per need.

```bash
cd multi-master-kubernetes-ansible/
ansible-playbook -i inventory/mycluster etc-hosts-entry.yaml
ansible-playbook -i inventory/mycluster add-repository.yaml
ansible-playbook -i inventory/mycluster containerd-setup.yaml
ansible-playbook -i inventory/mycluster pre-requisities-kubeadm.yaml
ansible-playbook -i inventory/mycluster kubernetes-setup.yaml
ansible-playbook -i inventory/mycluster firewall-setup-master.yaml
ansible-playbook -i inventory/mycluster firewall-setup-worker.yaml
ansible-playbook -i inventory/mycluster cfssl-setup.yaml
ansible-playbook -i inventory/mycluster generate-etcd-certs.yaml
ansible-playbook -i inventory/mycluster etcd-prerequisite.yaml
ansible-playbook -i inventory/mycluster etcd-setup.yaml
ansible-playbook -i inventory/mycluster keepalived-first-master.yaml
ansible-playbook -i inventory/mycluster keepalived-other-master.yaml
ansible-playbook -i inventory/mycluster kubeadm-init-prep.yaml
ansible-playbook -i inventory/mycluster kubeadm-init-first-master.yaml
ansible-playbook -i inventory/mycluster kubeadm-init-other-master.yaml
ansible-playbook -i inventory/mycluster calico.yaml
ansible-playbook -i inventory/mycluster metallb-setup.yaml
ansible-playbook -i inventory/mycluster contour-setup.yaml
ansible-playbook -i inventory/mycluster version-lock-kubernetes.yaml




```

## Usage of inventory/mycluster file defined variables

```bash


[all:vars]

# Here shall go containerd version which is planned for installation
containerd_version= 

impact at roles/docker-setup/tasks/main.yaml file.

# Here shall go kubernetes version which is planned for installation
kubernetes_version=

impact at roles/kubernetes-setup/tasks/main.yaml file.

# Here shall go kubernetes components version which is planned for installation
kubelet_version=
kubeadm_version=
kubectl_version=

impact at roles/kubernetes-setup/tasks/main.yaml file.

# Here shall go virtual_ip mentioned at check_apiserver.sh file  and control_plane_endpoint at config.yaml which is planned for installation
virtual_ip=

impact at roles/keepalived/templates/check_apiserver.sh file.
impact at roles/keepalived/templates/keepalived.conf file.

# Here shall go first master, second master, third master hostname which is planned for installation
first_master=
second_master=
third_master=

# Here shall go metallb system IP pool which is planned for installation
metallb_ip=

impact at roles/metallb-setup/templates/configmap.yaml file.

# Here shall go POD Network CIDR which is planned for installation
pod_network=

impact at roles/kubeadm-init-prep/templates/kubeadm-config.yaml file.

# Here shall go first master, second master, third master IP Address which is planned for installation
first_master_ip=
second_master_ip=
third_master_ip=


# Here shall go network interface card name of the platform which is planned for installation
network_interface=

impact at roles/keepalived/templates/keepalived.conf file.

# Here shall go first worker, second worker, third worker hostname which is planned for installation
first_worker=
first_worker_ip=
second_worker=
second_worker_ip=
third_worker=
third_worker_ip=


# Here shall go control_plane_endpoint at config.yaml which is planned for installation
kube_api_server=

impact at roles/keepalived/templates/check_apiserver.sh file.

# Here shall go virtual_router_id
virtual_router_id=
```
