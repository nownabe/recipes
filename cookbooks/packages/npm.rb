raise "Remove this file. Use $HOME/.default-npm-packages. https://github.com/kennyp/asdf-golang#default-go-get-packages"

%w(
  bower
  grpc-tools
  pulp
  purescript
  typescript
).each do |pkg|
  execute "Install #{pkg} npm" do
    command $anyenv_cmd.call("npm install -g #{pkg}")
    not_if $anyenv_cmd.call("npm list -g #{pkg}")
  end
end
