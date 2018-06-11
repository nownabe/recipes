.PHONY: apply
apply:
	mitamae local recipe.rb -y node.yaml

.PHONY: dry-run
dry-run:
	mitamae local recipe.rb -y node.yaml --dry-run

secret.rb.enc: secret.rb
	cryptography enc -in $< -out $@ -key ${ENCRYPTION_KEY}

secret.rb: secret.rb.enc
	cryptography dec -in $< -out $@ -key ${ENCRYPTION_KEY}
