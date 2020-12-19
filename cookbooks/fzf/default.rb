version = "0.17.4"

archive = File.join($tmpdir, "fzf.tgz")
url = "https://github.com/junegunn/fzf-bin/releases/download/#{version}/fzf-#{version}-linux_amd64.tgz"

execute "Download fzf" do
  command "curl -sSL -o #{archive} #{url}"
  notifies :run, "execute[Unarchive fzf]", :immediately
  not_if "[ -x #{home}/bin/fzf ]"
end

execute "Unarchive fzf" do
  action :nothing
  command "tar xf #{archive} -C #{home}/bin"
end

remote_file "#{home}/.zsh.d/fzf.zsh" do
  source "files/fzf.zsh"
end
