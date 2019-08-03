mage_version = "1.8.0"


mage_url = "https://github.com/magefile/mage/releases/download/v#{mage_version}/mage_#{mage_version}_Linux-64bit.tar.gz"

install_tar "mage" do
  url mage_url
  check expected: "#{mage_version}", args: "-version"
end
