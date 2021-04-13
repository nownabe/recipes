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

directory "#{home}/.config/nvim"

%w(
  base
  dein
  denite
  init
  keymap
  options
).each do |name|
  link "#{home}/.config/nvim/#{name}.vim" do
    to File.expand_path("../files/#{name}.vim", __FILE__)
  end
end

directory "#{home}/.config/nvim/dein"

%w(
  base
  lang
  lazy
).each do |name|
  link "#{home}/.config/nvim/dein/#{name}.toml" do
    to File.expand_path("../files/dein/#{name}.toml", __FILE__)
  end
end

directory "#{home}/.config/nvim/sonictemplate"

%w(
  ruby
).each do |name|
  directory "#{home}/.config/nvim/sonictemplate/#{name}"
  link "#{home}/.config/nvim/sonictemplate/#{name}/pattern.stpl" do
    to File.expand_path("../files/sonictemplate/#{name}.stpl", __FILE__)
  end
end
