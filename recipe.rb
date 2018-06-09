# ::Specinfra::HostInventory::KEYS.each do |key|
#   puts "======== #{key} ========"
#   p node.fetch_inventory_value(key)
#   puts
# end

$tmpdir = "#{Dir.tmpdir}/mitamae"
Dir.mkdir($tmpdir) unless File.exist?($tmpdir)

puts "tempdir: #{$tmpdir}"

include_recipe "./cookbooks/git"
include_recipe "./cookbooks/slack"
