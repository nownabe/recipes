package "git" do
  user "root"
end

template "gitconfig" do
  path "#{home}/.gitconfig"
  source "templates/gitconfig"
  variables(
    home: home,
    user_name: $secret.git.user,
    user_email: $secret.git.email,
  )
end

remote_file "#{home}/.commit_template" do
  source "files/commit_template"
end
