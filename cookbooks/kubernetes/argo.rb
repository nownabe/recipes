version = "2.4.0-rc1"
binary_url = "https://github.com/argoproj/argo/releases/download/v#{version}/argo-linux-amd64"

download_binary "argo" do
  url binary_url
  check_method expected: "argo: v#{version}", args: "version"
end
