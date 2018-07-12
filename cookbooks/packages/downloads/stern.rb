version = "1.7.0"
url = "https://github.com/wercker/stern/releases/download/#{version}/stern_linux_amd64"

execute "Download stern" do
  command "curl -sSL -o ${HOME}/bin/stern #{url}"
  notifies :run, "execute[Make stern executable]", :immediately
  not_if "[ -x ${HOME}/bin/stern ]"
end

execute "Make stern executable" do
  action :nothing
  command "chmod +x ${HOME}/bin/stern"
end
