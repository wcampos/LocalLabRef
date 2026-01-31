#!/bin/bash
# ArgoCD Installation Script for MicroK8s / vanilla Kubernetes

set -e

echo "Installing ArgoCD..."

# Apply namespace
kubectl apply -f namespace.yaml

# Install ArgoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Waiting for ArgoCD to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/argocd-server -n argocd

echo "ArgoCD installation complete!"
echo ""
echo "To get the admin password, run:"
echo "  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d"
echo ""
echo "To port-forward ArgoCD UI:"
echo "  kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo ""
echo "Then access ArgoCD at: https://localhost:8080"
