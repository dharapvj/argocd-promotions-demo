deploy-argo:
	helm upgrade --install argocd --version 3.33.6 --namespace argocd --create-namespace argo/argo-cd 
# -f values-argo.yaml --debug

setup-dev-apps:
	kubectl apply -f dev/