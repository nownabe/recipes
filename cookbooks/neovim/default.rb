version = "0.3.1"

url = "https://github.com/neovim/neovim/releases/download/v#{version}/nvim.appimage"
bin_path = "#{home}/bin/nvim"

execute "Download neovim" do
  command "curl -sSL -o #{bin_path} #{url}"
  notifies :run, "execute[Make neovim executable]", :immediately
  not_if "[ -x #{bin_path} ]"
end

execute "Make neovim executable" do
  action :nothing
  command "chmod +x #{bin_path}"
end
