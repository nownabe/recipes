package "zsh" do
  user "root"
end

execute "Set default shell to zsh" do
  user "root"
  command "usermod --shell /bin/zsh #{$secret.user}"
  not_if "grep #{$secret.user} /etc/passwd | grep -q zsh"
end
