# https://docs.docker.com/install/linux/docker-ce/ubuntu/

%w(apt-transport-https ca-certificates curl software-properties-common).each do |pkg|
  package pkg do
    user "root"
  end
end

execute "Add Docker's official GPG key" do
  user "root"
  command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -"
  not_if "apt-key list | grep -q Docker"
end

# TODO: Change the repository. See the installation document.
#       Now package for Ubuntu 19.10 is not released, so temporarily using repo for 19.04.
execute "Add docker repository" do
  user "root"
  command <<-CMD
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"
  CMD
  notifies :run, "execute[Update]", :immediately
  not_if "apt policy | grep -q docker"
end

%w(
  docker-ce
  docker-ce-cli
  containerd.io
).each do |pkg|
  package pkg do
    user "root"
  end
end

service "docker" do
  action :nothing
end

execute "Make users belong to docker group" do
  user "root"
  command "gpasswd -a #{username} docker"
  notifies :restart, "service[docker]"
  not_if "id #{username} | grep -q docker"
end

include_recipe "./compose"
# include_recipe "./nvidia"
