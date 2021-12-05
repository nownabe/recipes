package "zsh" do
  user "root"
end

execute "Set default shell to zsh" do
  user "root"
  command "usermod --shell /bin/zsh #{username}"
  only_if "grep -q #{username} /etc/passwd"
  not_if "grep #{username} /etc/passwd | grep -q zsh"
end

directory "#{home}/.zsh.d"
directory "#{home}/.zsh.d/completion"
directory "#{home}/.cache/shell"

link "#{home}/.zshrc" do
  to File.expand_path("../files/zshrc", __FILE__)
  not_if "[ -e #{home}/.zshrc ]"
end

git "#{home}/.zplug" do
  repository "https://github.com/zplug/zplug"
end

%w(
  00_base
  02_golang
  alias
  bind
  docker
  history
  zplug
).each do |name|
  link "#{home}/.zsh.d/#{name}.zsh" do
    to File.expand_path("../files/zsh.d/#{name}.zsh", __FILE__)
  end
end
