recipes
=======

[Mitamae](https://github.com/itamae-kitchen/mitamae) recipes to configure nownabe's Linux PC.

# Preparation

## Install mitamae and cryptography

Install mitamae and cryptography command and clone this repository.

```bash
$ sudo apt install curl
$ curl -sSL https://raw.githubusercontent.com/nownabe/recipes/master/init.sh | bash
```

## Decrypt secrets

Decrypt `secret.rb`.

```
$ ${HOME}/bin/cryptography dec -in secret.rb.enc -out secret.rb -key ${ENCRYPTION_KEY}
```

## Configure node.yaml

Create GPG key.

```bash
# Generate key
$ gpg --full-generate-key

# Get key ID
$ gpg --list-keys
```

Then create `node.yaml`.

```bash
$ cp node.yaml.example node.yaml
$ vi node.yaml
```

# Configure

```bash
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml --dry-run
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml
```

# Manual Setups

## Add GPG key into GitHub

Print GPG public key.

```bash
$ gpg --armor --export ${KEY_ID}
```

Copy public key and then add it into [GitHub](https://github.com/settings/keys).

## Generate SSH key pair

Generate SSH key pair.

```bash
$ ssh-keygen -t ed25519
```

Then add public key into [GitHub](https://github.com/settings/keys).

