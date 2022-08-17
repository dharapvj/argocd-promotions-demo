deploy: deploy-ingress-controller deploy-argo setup-dev-apps setup-stage-apps

create-kind-cluster:
	kind create cluster --config=./cluster-nodeport.yaml --image kindest/node:v1.23.0

deploy-argo:
	helm upgrade --install argocd --version 3.33.6 --namespace argocd --create-namespace argo/argo-cd -f values-argocd.yaml

setup-dev-apps:
	kubectl apply -f dev/

setup-stage-apps:
	kubectl apply -f stage/

deploy-ingress-controller:
# Under Kind use this
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
#	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.44.0/deploy/static/provider/cloud/deploy.yaml

## Helm chart creation related targets
helm-lint:
	helm lint helm/argo-demo-app

helm-publish:
	helm package helm/argo-demo-app
	# NOTE- switch to gh-pages branch can fail if you have modified files
	git checkout gh-pages
	mv argo-demo-app-*.tgz charts/
	helm repo index --url https://dharapvj.github.io/argocd-promotions-demo/ .
