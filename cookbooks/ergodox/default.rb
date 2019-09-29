install_tar "teensy" do
  url "https://www.pjrc.com/teensy/teensy_linux64.tar.gz"
end

rules_path = "/etc/udev/rules.d/49-teensy.rules"
rules_url = "https://www.pjrc.com/teensy/49-teensy.rules"

execute "Download Teensy udev rules" do
  user "root"
  command "curl -LSs -o #{rules_path} #{rules_url}"
end
