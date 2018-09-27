repo = "github.com/ahmetb/kubectx"
srcpath = "/home/#{$secret.user}/src/#{repo}"

git srcpath do
  repository "https://#{repo}"
end

link "/home/#{$secret.user}/bin/kubectx" do
  to "#{srcpath}/kubectx"
end

link "/home/#{$secret.user}/bin/kubens" do
  to "#{srcpath}/kubens"
end

link "/home/#{$secret.user}/.zsh.d/completion/_kubectx" do
  to "#{srcpath}/completion/kubens.zsh"
end

link "/home/#{$secret.user}/.zsh.d/completion/_kubens" do
  to "#{srcpath}/completion/kubens.zsh"
end
