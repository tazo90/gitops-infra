# Monorepo starter 
https://github.com/thmsmtylr/turborepo-starter/tree/main


# Deploy multiple apps via ArgoCD, Kustomize, K8s, Github Actions
https://github.com/myspotontheweb/gitops-demo-app1/tree/main
https://github.com/myspotontheweb/gitops-workloads/tree/master/apps
https://github.com/myspotontheweb/gitops-demo-app1/blob/main/.github/workflows/ci.yml#L52-L76
https://www.reddit.com/r/kubernetes/comments/116g3yv/how_to_update_image_tags_in_separate_config_repo/
https://hackernoon.com/creating-gitops-workflow-with-argocd-kustomize-and-github-actions-nxs3uws
https://github.com/Akshit8/ci-cd-k8s
https://www.linkedin.com/pulse/argo-cd-image-updater-make-your-gitops-life-easier-setup-halvarsson
https://mrdevops.medium.com/github-action-kustomize-argocd-94e5abfcf6bd
https://medium.com/@albertorojasm95/starter-github-actions-workflows-for-kubernetes-77ed41071ec5
https://github.blog/2023-02-28-how-to-build-a-consistent-workflow-for-development-and-operations-teams/
https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment


# Overview

In my case, I implemented a simple github action that fix 'yaml' format file in another repo then commit it.

I have two kinds of github repositories, the one is for application development and the other for storing k8s manifests which app-of-apps pattern is applied.

There is a github action for CI/CD in my development repository triggered when dev branches are merged to the 'main'.

It build new docker image and publish it to Docker hub(or AWS ECR) with version tag, then update values.yaml with the tag in k8s manifests repository helm chart via another github action ('fix-yaml-in-another-repo')