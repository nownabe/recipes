execute "Add asciinema repository" do
  user "root"
  command "apt-add-repository -y ppa:zanchey/asciinema"
  notifies :run, "execute[Update]", :immediately
  not_if "apt-cache policy | grep -q zanchey/asciinema"
end

package "asciinema" do
  user "root"
end
