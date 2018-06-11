python_version = "2.7.15"
python_path = "/home/#{$secret.user}/.anyenv/envs/pyenv/versions/#{python_version}/bin/python"
gcloud_archive = File.join($tmpdir, "gcloud.tar.gz")

execute "Install python 2.7" do
  command $anyenv_cmd.call("pyenv install #{python_version}")
  not_if $anyenv_cmd.call("pyenv versions | grep -q #{python_version}")
end

directory "/home/#{$secret.user}/opt"

execute "Download gcloud" do
  command "curl -sSL -o #{gcloud_archive} https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-204.0.0-linux-x86_64.tar.gz"
  not_if "[ -d /home/#{$secret.user}/opt/google-cloud-sdk ] || [ -e #{gcloud_archive} ]"
end

execute "Unarchive gcloud" do
  command "tar xf #{gcloud_archive} -C /home/#{$secret.user}/opt"
  not_if "[ -d /home/#{$secret.user}/opt/google-cloud-sdk ]"
  notifies :run, "execute[Install gcloud]", :immediately
end

execute "Install gcloud" do
  action :nothing
  command <<-CMD
    export CLOUDSDK_PYTHON="#{python_path}"
    #{python_path} /home/#{$secret.user}/opt/google-cloud-sdk/bin/bootstrapping/install.py -q
  CMD
end

template "/home/#{$secret.user}/.zsh.d/gcloud.zsh" do
  source "templates/gcloud.zsh"
  variables python_path: python_path
end
