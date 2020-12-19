package "git" do
  user "root"
end

template "gitconfig" do
  path "#{home}/.gitconfig"
  source "templates/gitconfig"
end

remote_file "#{home}/.commit_template" do
  source "files/commit_template"
end
