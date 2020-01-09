# ENV
# This will load and export variables from an env files
include .env
export

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

me: ## Show your current AWS identity
	@aws sts get-caller-identity --output json

validate: ## Validate all compliances
	@pipenv run pre-commit run --all-files

deploy: validate ## Deploy pipelines
	@bin/deploy

tear-down: ## Destroy pipelines
	@read -p "Are you sure that you want to remove all AWS resources? [y/N]: " sure && [ $${sure:-N} = y ]
	@bin/tear-down
