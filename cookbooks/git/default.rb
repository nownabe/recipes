package "git" do
  user "root"
end

template "gitconfig" do
  path "/home/#{$secret.user}/.gitconfig"
  source "templates/gitconfig"
end

remote_file "/home/#{$secret.user}/.commit_template" do
  source "files/commit_template"
end
