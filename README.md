recipes
=======

[Mitamae](https://github.com/itamae-kitchen/mitamae) recipes to configure nownabe's Linux PC.

# First run

## Install mitamae and cryptography

Install mitamae and cryptography command and clone this repository.

```bash
$ sudo apt install curl
$ curl -sSL https://raw.githubusercontent.com/nownabe/recipes/master/init.sh | bash
```

## Create GPG key

```bash
# Generate key
gpg --full-generate-key

# Get key ID
gpg --list-keys
```

## Configure variables

```bash
cp variables.rb.example variables.rb
gedit variables.rb
```

## Run

```bash
$ ${HOME}/bin/mitamae local recipe.rb --dry-run
$ ${HOME}/bin/mitamae local recipe.rb
```

# Manual Setups

* [Install Google Chrome](https://www.google.com/intl/ja_jp/chrome/)

## Add GPG key into GitHub

Print GPG public key.

```bash
$ gpg --armor --export ${KEY_ID}
```

Copy public key and then add it into [GitHub](https://github.com/settings/keys) and [GitLab.com](https://gitlab.com/profile/gpg_keys).

## Generate SSH key pair

Generate SSH key pair.

```bash
$ ssh-keygen -t ed25519
```

Then add public key into [GitHub](https://github.com/settings/keys) and [GitLab.com](https://gitlab.com/profile/keys).

