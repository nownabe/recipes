# frozen_string_literal: true

# ::Specinfra::HostInventory::KEYS.each do |key|
#   puts "======== #{key} ========"
#   p node.fetch_inventory_value(key)
#   puts
# end

include_recipe "./ext"
include_recipe "./util"
include_recipe "./variables"

def is_wsl?
  !!ENV["WSL_DISTRO_NAME"]
end

execute "Update" do
  user "root"
  command "apt update"
end

if ENV.key?("ONLY")
  ENV["ONLY"].split(",").each do |cookbook|
    include_recipe "./cookbooks/#{cookbook}"
  end
else
  # Default cookbooks

  # Essential recipes
  include_recipe "./cookbooks/apt"

  # include_recipe "./cookbooks/sysctl"
  include_recipe "./cookbooks/git"
  include_recipe "./cookbooks/zsh"

  include_recipe "./cookbooks/asdf"
  # include_recipe "./cookbooks/asciinema"
  # include_recipe "./cookbooks/charles"
  include_recipe "./cookbooks/dart"
  include_recipe "./cookbooks/direnv"
  include_recipe "./cookbooks/discord" unless is_wsl?
  # include_recipe "./cookbooks/docker"
  # include_recipe "./cookbooks/ergodox"
  include_recipe "./cookbooks/fzf"
  # include_recipe "./cookbooks/gcloud"
  include_recipe "./cookbooks/github"
  include_recipe "./cookbooks/gitlab"
  include_recipe "./cookbooks/go"
  include_recipe "./cookbooks/gsettings" unless is_wsl?
  include_recipe "./cookbooks/haskell"
  # include_recipe "./cookbooks/helm"
  # include_recipe "./cookbooks/kubernetes"
  include_recipe "./cookbooks/neovim"
  include_recipe "./cookbooks/obs" unless is_wsl?
  # include_recipe "./cookbooks/protobuf"
  include_recipe "./cookbooks/python"
  include_recipe "./cookbooks/ruby"
  include_recipe "./cookbooks/rust"
  # include_recipe "./cookbooks/shutter"
  include_recipe "./cookbooks/slack" unless is_wsl?
  # include_recipe "./cookbooks/terraform"
  include_recipe "./cookbooks/vscode" unless is_wsl?
  # include_recipe "./cookbooks/wine"

  # include_recipe "./cookbooks/packages"
end
