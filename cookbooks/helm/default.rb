# https://helm.sh/docs/intro/install/

version = "3.0.2"

url = "https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3"
install_dir = File.join("/home", $secret.user, "bin")

execute "Install Helm" do
  command <<-CMD
    export USE_SUDO=false
    export HELM_INSTALL_DIR=#{install_dir}
    curl #{url} | bash
  CMD
  not_if "#{install_dir}/helm version --short | grep -q v#{version}"
end

include_recipe "./repo"
