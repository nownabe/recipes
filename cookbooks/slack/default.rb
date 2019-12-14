slack_version = "4.2.0"

package_path = File.join($tmpdir, "slack.deb")
check_installation = "dpkg-query -f '${Status}' -W slack-desktop | grep -q 'install ok installed'"

execute "Download slack" do
  command "curl -L -o #{package_path} https://downloads.slack-edge.com/linux_releases/slack-desktop-#{slack_version}-amd64.deb"
  not_if "[ -e #{package_path} ] || #{check_installation}"
end


%w(gconf2 gconf-service python libappindicator1).each do |pkg|
  package pkg do
    user "root"
  end
end

execute "Install slack" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_installation
end
