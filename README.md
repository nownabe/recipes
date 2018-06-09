recipes
=======

[Mitamae](https://github.com/itamae-kitchen/mitamae) recipes to configure nownabe's Linux PC.

# Preparation

Install mitamae and cryptography command and clone this repository.

```bash
$ sudo apt install curl
$ curl -sSL https://raw.githubusercontent.com/nownabe/recipes/master/init.sh | bash
```

Decrypt `secret.rb`.

```
$ ${HOME}/bin/cryptography dec -in secret.rb.enc -out secret.rb -key ${ENCRYPTION_KEY}
```

Create `node.yaml`.

```bash
$ cp node.yaml.example node.yaml
$ vi node.yaml
```

# Configure

```bash
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml --dry-run
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml
```
