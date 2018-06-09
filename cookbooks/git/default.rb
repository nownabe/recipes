package "git"

template "gitconfig" do
  path "/home/#{node.user}/.gitconfig"
  source "templates/gitconfig"
end
