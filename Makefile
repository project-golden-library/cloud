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

tf-format-modules-lambda-function:
	cd terraform/modules/lambda_function && \
	terraform fmt

tf-format: \
	tf-format-environment \
	tf-format-modules-root \
	tf-format-modules-lambda-function \

format: \
	isort \
	black \
	tf-format

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
