#!/bin/bash

set -eux

mitamae_version=v1.5.6

[[ -d ${HOME}/bin ]] || mkdir ${HOME}/bin

: Install mitamae
if [[ ! -x ${HOME}/bin/mitamae ]]; then
  curl -sSL -o ${HOME}/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/download/${mitamae_version}/mitamae-x86_64-linux
  chmod +x ${HOME}/bin/mitamae
fi

: Install git
sudo apt update -y
type git || sudo apt install -y git

: Clone recipes
[[ -d ${HOME}/src/github.com/nownabe/recipes ]] || git clone https://github.com/nownabe/recipes.git ${HOME}/src/github.com/nownabe/recipes
