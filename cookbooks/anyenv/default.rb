envs = {
  go: { env: "goenv", version: "1.15.0" },
  java: { env: "jenv" },
  node: { env: "nodenv", version: "14.8.0" },
  python: { env: "pyenv", version: "3.8.5" },
  ruby: { env: "rbenv", version: "2.7.1" },
}

git "#{home}/.anyenv" do
  repository "https://github.com/riywo/anyenv.git"
end

git "#{home}/.anyenv/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update.git"
end

execute "Initialize anyenv" do
  command <<-CMD
    PATH="${HOME}/.anyenv/bin:$PATH"
    anyenv install --force-init
  CMD
  not_if "[ -d $HOME/.config/anyenv ]"
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
