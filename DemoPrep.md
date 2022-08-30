# Before Demo

1. Scale resolution down
1. Increase font size in vscode and in terminal
1. Create kind cluster (`make create-kind-cluster`)
1. Keep argocd and apps deployed  (`make`)
1. Keep argocd and dev stage apps for both raw and helm deploy open in browser?

Keep below URLs open
http://localhost/applications?proj=&sync=&health=&namespace=&cluster=&labels=
http://localhost/yellow-dev-raw/
http://localhost/yellow-dev/
http://localhost/yellow-stage-raw/
http://localhost/yellow-stage/

Color options
- darkseagreen
- cornflowerblue
- deeppink 
- ivory
- lemonchiffon
- palegreen
- navajowhite
- Moccasin

Files to change for demo
raw-manifest/overlays/dev/deploy_env.yaml

```
# to see the tag details
git --no-pager log --oneline
git tag -f bgapp-stage

# For helm demo
# remember to update chart version
```