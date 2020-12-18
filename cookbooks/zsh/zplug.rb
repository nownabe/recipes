git "#{home}/.zplug" do
  repository "https://github.com/zplug/zplug"
end

remote_file "#{home}/.zsh.d/zplug.zsh" do
  source "files/zplug.zsh"
end
