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

execute "Add docker repository" do
  user "root"
  command <<-CMD
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  CMD
  notifies :run, "execute[Update]", :immediately
  not_if "apt policy | grep -q docker"
end

package "docker-ce" do
  user "root"
end

service "docker" do
  action :nothing
end

execute "Make users belong to docker group" do
  user "root"
  command "gpasswd -a #{$secret.user} docker"
  notifies :restart, "service[docker]"
  not_if "id #{$secret.user} | grep -q docker"
end

include_recipe "./compose"
