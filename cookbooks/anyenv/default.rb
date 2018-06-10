envs = {
  ruby: { env: "rbenv", version: "2.5.1" },
}

env_cmd = proc do |cmd|
  <<-CMD
    PATH="${HOME}/.anyenv/bin:${PATH}"
    bash -c '
      eval "$(anyenv init -)"
      #{cmd}
    '
  CMD
end

git "/home/#{$secret.user}/.anyenv" do
  repository "https://github.com/riywo/anyenv.git"
end

git "/home/#{$secret.user}/.anyenv/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update.git"
end

envs.each do |lang, env|
  execute "Install #{env[:env]}" do
    command env_cmd.call("anyenv install #{env[:env]}")
    not_if env_cmd.call("anyenv versions | grep -q #{env[:env]}")
  end

  execute "Install #{lang} #{env[:version]}" do
    command env_cmd.call("#{env[:env]} install #{env[:version]} && #{env[:env]} global #{env[:version]}")
    not_if env_cmd.call("#{env[:env]} versions | grep -q #{env[:version]}")
  end
end
