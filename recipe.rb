# ::Specinfra::HostInventory::KEYS.each do |key|
#   puts "======== #{key} ========"
#   p node.fetch_inventory_value(key)
#   puts
# end

include_recipe "./cookbooks/git"
