remote_file "/etc/sysctl.d/custom.conf" do
  user "root"
  notifies :run, "execute[Reload sysctl]", :immediately
end

execute "Reload sysctl" do
  action :nothing
  user "root"
  command "sysctl -p"
end
