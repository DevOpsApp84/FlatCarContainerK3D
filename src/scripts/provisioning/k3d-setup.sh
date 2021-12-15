#!/bin/bash
k3d cluster create tetrate --k3s-arg "--disable=traefik@server:0" -a 1
kubectl get no