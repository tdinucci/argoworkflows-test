#!/bin/bash 
kind create cluster --image kindest/node:v1.23.13 --name argo-workflows

kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.4.3/install.yaml

kubectl apply -f manifests/role.yaml 

kubectl patch deployment \
  argo-server \
  --namespace argo \
  --type='json' \
  -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": [
  "server",
  "--auth-mode=server"
]}]'

echo -e "\nWaiting for Argo Workflows components to initialise..."
sleep 30
kubectl wait --timeout=120s -n argo --for=condition=ready pod -l app=argo-server

echo -e "\n\n\n*******************************"
echo "Argo Workflows UI: https://localhost:2746"
echo -e "\nTell your browser you're OK with an untrusted cert :) "
echo -e "*******************************\n\n"

kubectl -n argo port-forward deployment/argo-server 2746:2746
