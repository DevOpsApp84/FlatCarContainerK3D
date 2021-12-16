!!! THIS IS BRIDGE VERSION IF YOU WOULD LIKE TO USE PLEASE ADJUST NETWORK ADAPTER FOR YOUR NEEDS !!!
## Kubernetes k3d lab based on FlatCar Container OS
```
.--------------------------------------------------------------------.
| This is 2 node cluster contains 1 control plane and 1 worker node. |
| Inside VM learn machine we have k3d cluster based on rancher    | 
'--------------------------------------------------------------------'
```

## Kubernetes version
So far ist is v1.21.5+k3s2

## Requirements
Here will be short list about all requirements needed to run this environment.

+ Hardware:
  * 2 CPU
  * 4 GB RAM
  * 15GB HDD it is thin provisioning

+ Operating system:
  * Linux/Windows/WSL or git Bash

+ Software
  * VirtualBox
  * Vagrant

## Before you start
1. Clone repo
2. Add FlatCar Container Box to vagrant

```
wget https://alpha.release.flatcar-linux.net/amd64-usr/current/flatcar_production_vagrant.box
wget https://alpha.release.flatcar-linux.net/amd64-usr/current/flatcar_production_vagrant.box.sig
gpg --verify flatcar_production_vagrant.box.sig
vagrant box add flatcar-alpha flatcar_production_vagrant.box
```