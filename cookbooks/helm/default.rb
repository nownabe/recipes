version = "2.9.1"

url = "https://storage.googleapis.com/kubernetes-helm/helm-v#{version}-linux-amd64.tar.gz"
archive = File.join($tmpdir, "helm.tar.gz")

execute "Download Helm" do
  command "curl -sSL -o #{archive} #{url}"
  notifies :run, "execute[Install Helm]", :immediately
  not_if "[ -x ${HOME}/bin/helm ]"
end

execute "Install Helm" do
  action :nothing
  command <<-CMD
    mkdir -p helm-installation
    tar xf #{archive} -C helm-installation
    mv helm-installation/linux-amd64/helm ~/bin/helm
  CMD
  cwd $tmpdir
end
