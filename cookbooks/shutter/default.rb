package "shutter" do
  user "root"
end

execute "Add shutter repository" do
  user "root"
  command "apt-add-repository -y -n ppa:sicklylife/ppa"
  notifies :run, "execute[Update]", :immediately
  not_if "apt-cache policy | grep -q sicklylife/ppa"
end

package "libgoo-canvas-perl" do
  user "root"
end
