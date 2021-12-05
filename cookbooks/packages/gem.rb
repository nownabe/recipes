raise "Remove this file. Use $HOME/.default-gems. https://github.com/asdf-vm/asdf-ruby#default-gems"

%w(
  grpc-tools
  travis
).each do |pkg|
  execute "Install #{pkg} gem" do
    command $anyenv_cmd.call("gem install #{pkg}")
    not_if $anyenv_cmd.call("gem list | grep -q #{pkg}")
  end
end
