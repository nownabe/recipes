version = "1.7.0"
binary_url = "https://github.com/amacneil/dbmate/releases/download/v#{version}/dbmate-linux-amd64"

download_binary "dbmate" do
  url binary_url
  check_method expected: "dbmate version #{version}", args: "--version"
end
