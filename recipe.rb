# ::Specinfra::HostInventory::KEYS.each do |key|
#   puts "======== #{key} ========"
#   p node.fetch_inventory_value(key)
#   puts
# end

include_recipe "./secret"

$tmpdir = "#{Dir.tmpdir}/mitamae"
Dir.mkdir($tmpdir) unless File.exist?($tmpdir)

puts "tempdir: #{$tmpdir}"

execute "Update" do
  user "root"
  command "apt update"
end

include_recipe "./cookbooks/build-essentials"
include_recipe "./cookbooks/sysctl"
include_recipe "./cookbooks/git"
include_recipe "./cookbooks/zsh"
include_recipe "./cookbooks/anyenv"

include_recipe "./cookbooks/direnv"
include_recipe "./cookbooks/docker"
include_recipe "./cookbooks/fzf"
include_recipe "./cookbooks/gcloud"
include_recipe "./cookbooks/github"
include_recipe "./cookbooks/helm"
include_recipe "./cookbooks/neovim"
include_recipe "./cookbooks/python"
include_recipe "./cookbooks/ruby"
include_recipe "./cookbooks/slack"
include_recipe "./cookbooks/terraform"

include_recipe "./cookbooks/packages"
