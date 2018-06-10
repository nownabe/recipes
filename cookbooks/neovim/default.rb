%w(neovim python-neovim python3-neovim).each do |pkg|
  package pkg do
    user "root"
  end
end
