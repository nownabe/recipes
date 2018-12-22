.PHONY: run
run:
	mitamae local recipe.rb -y node.yaml

.PHONY: dry-run
dry-run:
	mitamae local recipe.rb -y node.yaml --dry-run

secret.rb.enc:
	@cryptography enc -in $< -out $@ -key ${ENCRYPTION_KEY}

secret.rb:
	@cryptography dec -in $< -out $@ -key ${ENCRYPTION_KEY}
