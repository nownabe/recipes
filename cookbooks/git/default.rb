package "git" do
  user "root"
end

template "gitconfig" do
  path "#{home}/.gitconfig"
  source "templates/gitconfig"
  variables(
    home: home,
    user_name: $env.git.user,
    user_email: $env.git.email,
    gpg_key_id: $env.git.gpg_key_id,
    github_token: $env.github.token,
    additional_github_users: $env.git.additional_github_users,
  )
end

remote_file "#{home}/.commit_template" do
  source "files/commit_template"
end
