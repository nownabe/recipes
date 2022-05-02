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
    github_token: $env.github.token,
    configs: $env.git.configs.keys,
  )
end

$env.git.configs.each do |root, config|
  path = File.join(File.expand_path(root), ".gitconfig")
  template path do
    source "templates/sub-config.erb"
    variables(config: config)
  end
end

remote_file "#{home}/.commit_template" do
  source "files/commit_template"
end
