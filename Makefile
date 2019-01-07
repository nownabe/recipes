.PHONY: run
run:
	mitamae local recipe.rb -y node.yaml

.PHONY: dry-run
dry-run:
	mitamae local recipe.rb -y node.yaml --dry-run

.PHONY: secret.rb.enc
secret.rb.enc:
	@cryptography enc -in secret.rb -out $@ -key ${ENCRYPTION_KEY}

.PHONY: secret.rb
secret.rb:
	@cryptography dec -in secret.rb.enc -out $@ -key ${ENCRYPTION_KEY}
