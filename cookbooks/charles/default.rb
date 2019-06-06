execute "Add charles' GPG key" do
  user "root"
  command "wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -"
  not_if "apt-key list | grep -q 'Charles Proxy'"
end

execute "Add charles repository" do
  user "root"
  command <<-CMD
    add-apt-repository \
      "deb https://www.charlesproxy.com/packages/apt/ charles-proxy main"
  CMD
  notifies :run, "execute[Update]", :immediately
  not_if "apt policy | grep -q 'charles-proxy/main'"
end

package "charles-proxy" do
  user "root"
end
