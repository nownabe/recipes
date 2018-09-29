%w(
  bower
  pulp
  purescript
  typescript
).each do |pkg|
  execute "Install #{pkg} npm" do
    command $anyenv_cmd.call("npm install -g #{pkg}")
    not_if $anyenv_cmd.call("npm list -g #{pkg}")
  end
end
