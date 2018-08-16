gpgkey_url = "https://nvidia.github.io/nvidia-docker/gpgkey"

execute "Add nvidia-docker repository key" do
  user "root"
  command "curl -sSL #{gpgkey_url} | apt-key add -"
  not_if "apt-key list | grep -q 'cudatools@nvidia.com'"
end

dist = run_command(". /etc/os-release && echo $ID$VERSION_ID").stdout.chomp
repo_url = "https://nvidia.github.io/nvidia-docker/#{dist}/nvidia-docker.list"
list_path = "/etc/apt/sources.list.d/nvidia-docker.list"

execute "Add nvidia-docker repository" do
  user "root"
  command "curl -sSL -o #{list_path} #{repo_url}"
  notifies :run, "execute[Update]", :immediately
  not_if "[ -f #{list_path} ]"
end

package "nvidia-docker2" do
  user "root"
  notifies :restart, "service[docker]"
end
