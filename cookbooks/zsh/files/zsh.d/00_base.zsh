autoload -Uz compinit
compinit -u

autoload -Uz colors
colors

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt auto_menu
setopt extended_glob
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

setopt interactive_comments
setopt correct
