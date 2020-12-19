export CLOUDSDK_PYTHON="<%= @python_path %>"

if [[ -f <%= @home %>/opt/google-cloud-sdk/path.zsh.inc ]]; then
  source <%= @home %>/opt/google-cloud-sdk/path.zsh.inc
fi

if [[ -f <%= @home %>/opt/google-cloud-sdk/completion.zsh.inc ]]; then
  source <%= @home %>/opt/google-cloud-sdk/completion.zsh.inc
fi

alias gcloud="${CLOUDSDK_PYTHON} <%= @home %>/opt/google-cloud-sdk/lib/gcloud.py"
alias dev_appserver="${CLOUDSDK_PYTHON} <%= @home %>/opt/google-cloud-sdk/bin/dev_appserver.py"
