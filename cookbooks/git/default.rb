package "git"

template "gitconfig" do
  path "/home/#{$secret.user}/.gitconfig"
  source "templates/gitconfig"
end
