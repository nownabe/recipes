version = "0.11.7"

archive = File.join($tmpdir, "terraform.zip")

execute "Download terraform" do
  command "curl -sSL -o #{archive} https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_linux_amd64.zip"
  notifies :run, "execute[Unarchive terraform]", :immediately
  not_if "[ -x /home/#{$secret.user}/bin/terraform ]"
end

execute "Unarchive terraform" do
  action :nothing
  command "unzip -d /home/#{$secret.user}/bin #{archive}"
end
