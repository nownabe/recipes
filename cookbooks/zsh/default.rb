package "zsh" do
  user "root"
end

execute "Set default shell to zsh" do
  user "root"
  command "usermod --shell /bin/zsh #{$secret.user}"
  not_if "grep #{$secret.user} /etc/passwd | grep -q zsh"
end

directory "/home/#{$secret.user}/.zsh.d"
directory "/home/#{$secret.user}/.zsh.d/completion"

remote_file "/home/#{$secret.user}/.zshrc" do
  source "files/zshrc"
  not_if "[ -e /home/#{$secret.user}/.zshrc ]"
end

%w(
  00_base
  01_golang
  02_anyenv
  alias
  bind
  history
  prompt
).each do |name|
  remote_file "/home/#{$secret.user}/.zsh.d/#{name}.zsh" do
    source "files/zsh.d/#{name}.zsh"
  end
end
