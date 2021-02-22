export FZF_DEFAULT_OPTS='--height 30% --reverse --select-1 --exit-0 --multi'

function fzf-ghq() {
  local target_dir
  target_dir=$(ghq list | fzf --preview "batcat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.md")
  if [[ -n "$target_dir" ]]; then
    cd $(ghq root)/$target_dir
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-ghq
bindkey "^[" fzf-ghq


function fzf-cdr() {
  local target_dir
  target_dir=$(cdr -l | awk '{ print $2 }' | fzf --preview 'f() { sh -c "ls -hFGl $1" }; f {}')
  target_dir=$(echo ${target_dir/\~/$HOME})
  if [[ -n "$target_dir" ]]; then
    cd $target_dir
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-cdr
bindkey '^J' fzf-cdr
