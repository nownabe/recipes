version = "0.8.1"

url = "https://github.com/neovim/neovim/releases/download/v#{version}/nvim.appimage"
bin_path = "#{home}/bin/nvim"

execute "Download neovim" do
  command "curl -sSL -o #{bin_path} #{url}"
  notifies :run, "execute[Make neovim executable]", :immediately
  not_if "[ -x #{bin_path} ] && #{bin_path} -v | grep -q 'NVIM v#{version}'"
end

execute "Make neovim executable" do
  action :nothing
  command "chmod +x #{bin_path}"
end

link "#{home}/.config/nvim" do
  to File.expand_path("../config", __FILE__)
end


# Install packer.nvim
# https://github.com/wbthomason/packer.nvim/blob/master/README.md#quickstart

packer_path = "#{home}/.local/share/nvim/site/pack/packer/start/packer.nvim"

directory packer_path

git packer_path do
  repository "https://github.com/wbthomason/packer.nvim"
  depth 1
end
