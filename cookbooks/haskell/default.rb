execute "Install stack" do
  command "curl -sSL https://get.haskellstack.org/ | bash"
  notifies :run, "execute[stack setup]", :immediately
  not_if "type stack"
end

execute "stack setup" do
  action :nothing
  command "stack setup"
end
