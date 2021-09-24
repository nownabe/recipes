version = "0.88.1"

hugo_url = "https://github.com/gohugoio/hugo/releases/download/v#{version}/hugo_extended_#{version}_Linux-64bit.tar.gz"

install_tar "hugo" do
  url hugo_url
  check args: version, expected: "v#{version}"
end
