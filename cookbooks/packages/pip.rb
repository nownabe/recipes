%w(
  awscli
  neovim
  pipenv
).each do |pkg|
  execute "Install #{pkg}" do
    command $anyenv_cmd.call("pip install #{pkg}")
    not_if $anyenv_cmd.call("pip list | grep -q #{pkg}")
  end
end
