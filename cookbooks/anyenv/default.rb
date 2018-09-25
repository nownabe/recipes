envs = {
  go:   { env: "goenv", version: "1.10.3" },
  java: { env: "jenv" },
  node: { env: "ndenv", version: "v10.4.0" },
  python: { env: "pyenv", version: "3.6.5" },
  ruby: { env: "rbenv", version: "2.5.1" },
}

git "/home/#{$secret.user}/.anyenv" do
  repository "https://github.com/riywo/anyenv.git"
end

git "/home/#{$secret.user}/.anyenv/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update.git"
end

envs.each do |lang, env|
  execute "Install #{env[:env]}" do
    command $anyenv_cmd.call("anyenv install #{env[:env]}")
    not_if $anyenv_cmd.call("anyenv versions | grep -q #{env[:env]}")
  end

  if env[:version]
    execute "Install #{lang} #{env[:version]}" do
      command $anyenv_cmd.call("#{env[:env]} install #{env[:version]} && #{env[:env]} global #{env[:version]}")
      not_if $anyenv_cmd.call("#{env[:env]} versions | grep -q #{env[:version]}")
    end
  end
end
