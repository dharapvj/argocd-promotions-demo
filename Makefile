deploy-argo:
	helm upgrade --install argocd --version 3.33.6 --namespace argocd --create-namespace argo/argo-cd 
# -f values-argo.yaml --debug

setup-dev-apps:
	kubectl apply -f dev/

setup-stage-apps:
	kubectl apply -f stage/

## Helm chart creation related targets
helm-lint:
	helm lint helm/argo-demo-app

helm-publish:
	helm package helm/argo-demo-app
	# NOTE- switch to gh-pages branch can fail if you have modified files
	git checkout gh-pages
	mv argo-demo-app-*.tgz charts/
	helm repo index --url https://dharapvj.github.io/argocd-promotions-demo/charts/ .
