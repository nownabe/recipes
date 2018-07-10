%w(
  grpc-tools
).each do |pkg|
  execute "Install #{pkg} gem" do
    command $anyenv_cmd.call("gem install #{pkg}")
    not_if $anyenv_cmd.call("gem list | grep -q #{pkg}")
  end
end
