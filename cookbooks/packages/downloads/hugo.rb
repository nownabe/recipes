version = "0.62.0"

hugo_url = "https://github.com/gohugoio/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"

install_tar "hugo" do
  url hugo_url
end
