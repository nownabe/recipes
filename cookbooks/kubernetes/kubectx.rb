repo = "github.com/ahmetb/kubectx"
srcpath = "#{home}/src/#{repo}"

git srcpath do
  repository "https://#{repo}"
end

link "#{home}/bin/kubectx" do
  to "#{srcpath}/kubectx"
end

link "#{home}/bin/kubens" do
  to "#{srcpath}/kubens"
end

link "#{home}/.zsh.d/completion/_kubectx" do
  to "#{srcpath}/completion/kubens.zsh"
end

link "#{home}/.zsh.d/completion/_kubens" do
  to "#{srcpath}/completion/kubens.zsh"
end
