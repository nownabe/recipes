recipes
=======

[Mitamae](https://github.com/itamae-kitchen/mitamae) recipes to configure nownabe's Linux PC.

# Preparation

Install mitamae and cryptography command and clone this repository.

```
```

Decrypt `node.yaml`.

```
$ ${HOME}/bin/cryptography dec -in node.yaml.enc -out node.yaml -key ${ENCRYPTION_KEY}
```

# Configure

```bash
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml --dry-run
$ ${HOME}/bin/mitamae local recipe.rb -y node.yaml
```
