export CLOUDSDK_PYTHON="<%= @python_path %>"
alias gcloud="${CLOUDSDK_PYTHON} /home/<%= $secret.user %>/opt/google-cloud-sdk/lib/gcloud.py"
alias dev_appserver="${CLOUDSDK_PYTHON} /home/<%= $secret.user %>/opt/google-cloud-sdk/bin/dev_appserver.py"
