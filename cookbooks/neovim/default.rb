version = "0.4.4"

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
