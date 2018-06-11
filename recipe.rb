# ::Specinfra::HostInventory::KEYS.each do |key|
#   puts "======== #{key} ========"
#   p node.fetch_inventory_value(key)
#   puts
# end

include_recipe "./secret"

$tmpdir = "#{Dir.tmpdir}/mitamae"
Dir.mkdir($tmpdir) unless File.exist?($tmpdir)

puts "tempdir: #{$tmpdir}"

include_recipe "./cookbooks/build-essentials"
include_recipe "./cookbooks/git"
include_recipe "./cookbooks/anyenv"

include_recipe "./cookbooks/neovim"
include_recipe "./cookbooks/slack"
include_recipe "./cookbooks/zsh"

include_recipe "./cookbooks/packages"
include_recipe "./cookbooks/go_packages"
