export CLOUDSDK_PYTHON="<%= @python_path %>"

if [[ -f /home/<%= $secret.user %>/opt/google-cloud-sdk/path.zsh.inc ]]; then
  source /home/<%= $secret.user %>/opt/google-cloud-sdk/path.zsh.inc
fi

if [[ -f /home/<%= $secret.user %>/opt/google-cloud-sdk/completion.zsh.inc ]]; then
  source /home/<%= $secret.user %>/opt/google-cloud-sdk/completion.zsh.inc
fi

alias gcloud="${CLOUDSDK_PYTHON} /home/<%= $secret.user %>/opt/google-cloud-sdk/lib/gcloud.py"
alias dev_appserver="${CLOUDSDK_PYTHON} /home/<%= $secret.user %>/opt/google-cloud-sdk/bin/dev_appserver.py"
