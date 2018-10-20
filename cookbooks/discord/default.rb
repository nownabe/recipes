url = "https://discordapp.com/api/download?platform=linux&format=deb"

package_path = File.join($tmpdir, "discord.deb")

dependencies = %w(gconf2-common libgconf-2-4 libappindicator1 libindicator7)

check_template = "dpkg-query -f '${Status}' -W %s | grep -q 'install ok installed'"
check_discord = check_template % ["discord"]
check_dipendencies = dependencies.map { |d| check_template % [d] }.join(" && ")

execute "Install discord dipendencies" do
  user "root"
  command <<-CMD
    DEBIAN_FRONTEND=noninteractive \
      apt-get install -y #{dependencies.join(" ")}
  CMD
  not_if check_dipendencies
end

execute "Download discord" do
  command "curl -L -o #{package_path} '#{url}'"
  not_if "[ -e #{package_path} ] || #{check_discord}"
end

execute "Install discord" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_discord
end
