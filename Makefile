SHELL = /usr/bin/env bash -xeuo pipefail

stack_name:=project-golden-library-cloud

black:
	poetry run black src

isort:
	poetry run isort src

format: isort black

package:
	date > src/date.txt
	aws cloudformation package \
		--s3-bucket ${SAM_ARTIFACT_BUCKET} \
		--s3-prefix $(stack_name) \
		--template-file sam.yml \
		--output-template-file template.yml

deploy:
	sam deploy \
		--stack-name $(stack_name) \
		--template-file template.yml \
		--role-arn ${CLOUDFORMATION_DEPLOY_ROLE_ARN} \
		--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
		--no-fail-on-empty-changeset


describe:
	aws cloudformation describe-stacks \
		--stack-name $(stack_name) \
		--query Stacks[0].Outputs

.PHONY: \
	black \
	isort \
	format \
	package \
	deploy \
	describe
