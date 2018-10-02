url = "https://go.microsoft.com/fwlink/?LinkID=760868"

package_path = File.join($tmpdir, "visualstudiocode.rb")
check_installation = "dpkg-query -f '${Status}' -W code | grep -q 'install ok installed'"

execute "Download Visual Studio Code" do
  command "curl -L -o #{package_path} '#{url}'"
  not_if "[ -e #{package_path} ] || #{check_installation}"
end

execute "Install Visual Studio Code" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_installation
end
