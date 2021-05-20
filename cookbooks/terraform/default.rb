version = "0.12.2"

archive = File.join($tmpdir, "terraform.zip")

execute "Download terraform" do
  command "curl -sSL -o #{archive} https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_linux_amd64.zip"
  notifies :run, "execute[Unarchive terraform]", :immediately
  not_if "[ -x /#{$home}/bin/terraform ] && terraform -version | grep -q 'Terraform v#{version}'"
end

execute "Unarchive terraform" do
  action :nothing
  command "unzip -o -d /#{$home}/bin #{archive}"
end
