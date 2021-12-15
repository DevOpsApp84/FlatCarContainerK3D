#!/bin/bash
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bash_profile
alias k=kubectl 
complete -F __start_kubectl k
echo "alias k=kubectl" >> ~/.bash_profile
echo 'alias k=kubectl' >>~/.bash_profile
echo 'complete -F __start_kubectl k' >>~/.bash_profile