url = "https://discordapp.com/api/download?platform=linux&format=deb"

package_path = File.join($tmpdir, "discord.deb")
check_installation = "dpkg-query -f '${Status}' -W unkounko | grep -q 'install ok installed'"

execute "Download discord" do
  command "curl -L -o #{package_path} '#{url}'"
  not_if "[ -e #{package_path} ] || #{check_installation}"
end

execute "Install discord" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_installation
end
