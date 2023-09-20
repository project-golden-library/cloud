SHELL = /usr/bin/env bash -xeuo pipefail

stack_name:=project-golden-library-cloud

black:
	poetry run black src

isort:
	poetry run isort src

tf-format-environment:
	cd terraform/environment && \
	terraform fmt

tf-format-modules-root:
	cd terraform/modules/root && \
	terraform fmt

format: isort black tf-format-environment tf-format-modules-root

describe:
	aws cloudformation describe-stacks \
		--stack-name $(stack_name) \
		--query Stacks[0].Outputs

.PHONY: \
	black \
	isort \
	tf-format-environment \
	tf-format-modules-root \
	format \
	package \
	deploy \
	describe
