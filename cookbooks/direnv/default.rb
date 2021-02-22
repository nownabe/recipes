version = "v2.16.0"

bin_path = "#{home}/bin/direnv"

execute "Download direnv" do
  command "curl -sSL -o #{bin_path} https://github.com/direnv/direnv/releases/download/#{version}/direnv.linux-amd64"
  notifies :run, "execute[Make direnv executable]", :immediately
  not_if "[ -x #{bin_path} ]"
end

execute "Make direnv executable" do
  action :nothing
  command "chmod +x #{bin_path}"
end

remote_file "#{home}/.zsh.d/direnv.zsh" do
  source "files/direnv.zsh"
end
