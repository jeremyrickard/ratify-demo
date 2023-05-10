#!/bin/zsh
az acr login -n kubeconeu
kubectl delete -f https://deislabs.github.io/ratify/library/default/template.yaml
kubectl delete -f https://deislabs.github.io/ratify/library/default/samples/constraint.yaml
kubectl delete pod demo
kubectl delete -f package-verifier.yml
kubectl scale --replicas=0 deployment/ratify -n gatekeeper-system
kubectl scale --replicas=1 deployment/ratify -n gatekeeper-system
