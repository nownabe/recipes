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

remote_file "#{home}/.zshrc" do
  source "files/zshrc"
  not_if "[ -e #{home}/.zshrc ]"
end

%w(
  00_base
  01_golang
  02_anyenv
  alias
  bind
  docker
  history
).each do |name|
  remote_file "#{home}/.zsh.d/#{name}.zsh" do
    source "files/zsh.d/#{name}.zsh"
  end
end

%w(
).each do |name|
  remote_file "#{home}/.zsh.d/completion/_#{name}" do
    source "files/zsh.d/completion/_#{name}"
  end
end

include_recipe "./zplug"
