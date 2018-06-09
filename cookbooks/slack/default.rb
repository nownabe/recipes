slack_version = "3.2.1"

package_path = File.join($tmpdir, "slack.deb")

execute "Download slack" do
  command "curl -L -o #{package_path} https://downloads.slack-edge.com/linux_releases/slack-desktop-#{slack_version}-amd64.deb"
  not_if "[ -e #{package_path} ]"
end


%w(gconf2 gconf-service python libgnome-keyring0 gir1.2-gnomekeyring-1.0 libappindicator1).each do |pkg|
  package pkg do
    user "root"
  end
end

execute "Install slack" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if "dpkg-query -f '${Status}' -W slack-desktop | grep -q 'install ok installed'"
end
