slack_version = "4.7.0"

package_path = File.join($tmpdir, "slack-#{slack_version}.deb")
check_installation = "dpkg-query -W slack-desktop | grep -q '#{slack_version}'"

execute "Download slack" do
  command "curl -L -o #{package_path} https://downloads.slack-edge.com/linux_releases/slack-desktop-#{slack_version}-amd64.deb"
  not_if "[ -e #{package_path} ] || #{check_installation}"
end

execute "Install slack" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_installation
end
