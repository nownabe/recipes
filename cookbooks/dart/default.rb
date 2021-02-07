execute "Install Google signing key" do
  user "root"
  command "curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"
  not_if "apt-key list | grep -q 'Google Inc.'"
end

repo_url = "https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list"

execute "Add Dart stable repository" do
  user "root"
  command "curl -fsSL -o /etc/apt/sources.list.d/dart_stable.list #{repo_url}"
  not_if "[ -f /etc/apt/sources.list.d/dart_stable.list ]"
  notifies :run, "execute[Update]", :immediately
end

package "dart" do
  user "root"
end
