NAME      = flux-demo
IMAGE     = phoban01$(NAME)
COMPONENT = github.com/$(IMAGE)
VERSION   = v1.0.0

.PHONY: build
build:
	ocm create ca -S ocm.gardener.cloud/v3alpha1 $(COMPONENT) $(VERSION) phoban01 out/
	ocm add resources out resources/deploy.package.yaml
	ocm add resources out resources/kubernetes.manifests.yaml
	ocm add resources out resources/podinfo.oci.yaml


.PHONY: push
push:
	ocm transfer ca out ghcr.io/phoban01
