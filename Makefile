.PHONY: apply
apply:
	mitamae local recipe.rb -y node.yaml

.PHONY: dry-run
dry-run:
	mitamae local recipe.rb -y node.yaml --dry-run
