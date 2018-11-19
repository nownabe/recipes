execute "Add WineHQ key" do
  user "root"
  command "curl -fsSL https://dl.winehq.org/wine-builds/Release.key | apt-key add -"
  not_if "apt-key list | grep -q WineHQ"
end

execute "Add WineHQ repository" do
  user "root"
  command "apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'"
  notifies :run, "execute[Update]", :immediately
  not_if "apt policy | grep -q wine"
end

package "winehq-stable" do
  user "root"
end
