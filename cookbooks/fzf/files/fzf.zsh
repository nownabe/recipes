fzf-ghq() {
  local dir
  dir=$(ghq list > /dev/null | fzf --reverse +m) \
    && cd $(ghq root)/$dir
}
zle -N fzf-ghq

bindkey "^[" fzf-ghq
