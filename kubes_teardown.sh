#!/bin/sh

kubectl delete namespace jenkins
kubectl delete namespace dieroll
kubectl delete namespace sonarqube
kubectl delete namespace nexus
kubectl delete namespace ingress-nginx