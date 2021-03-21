version = "1.28.5"

os = run_command("uname -s").stdout.chomp
arch = run_command("uname -m").stdout.chomp
url = "https://github.com/docker/compose/releases/download/#{version}/docker-compose-#{os}-#{arch}"

execute "Download docker-compose" do
  command "curl -sSL -o ${HOME}/bin/docker-compose #{url}"
  notifies :run, "execute[Make docker-compose executable]", :immediately
  not_if "[ -x ${HOME}/bin/docker-compose ]"
end

execute "Make docker-compose executable" do
  action :nothing
  command "chmod +x ${HOME}/bin/docker-compose"
end

completion_path = "#{home}/.zsh.d/completion/_docker-compose"
completion_url = "https://raw.githubusercontent.com/docker/compose/#{version}/contrib/completion/zsh/_docker-compose"

execute "Download docker-compose completion" do
  command "curl -sSL -o #{completion_path} #{completion_url}"
  not_if "[ -e #{completion_path} ]"
end
