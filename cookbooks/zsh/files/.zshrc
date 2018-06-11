for config in $(ls ~/.zsh.d/*.zsh); do
  source $config
done
