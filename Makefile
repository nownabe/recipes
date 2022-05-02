.PHONY: run
run:
	mitamae local recipe.rb

.PHONY: dry-run
dry-run:
	mitamae local recipe.rb --dry-run
