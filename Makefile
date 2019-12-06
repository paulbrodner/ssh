help: # output help of this makefile
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?##|[a-zA-Z_-]\.?+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := conn

CONNECTIONS?=connections.yml

conn: ## list available connections
	@echo These are the available connections. 
	@yq r $(CONNECTIONS) 'connection[*].name' | xargs -I % sh -c "echo  %" | nl -ba -nln -v 0
	@echo Please choose the number assigned to desired connection above: && read number && \
	echo "You choosed [`yq r $(CONNECTIONS) "connection[$$number].name"`] Connecting..." && \
	`yq r $(CONNECTIONS) "connection[$$number].command"`

prereq: ## install prerequisites
	@echo Installing prerequisites. Standing by...
	brew install yq
	brew install .formulas/sshpass.rb
