directory "/home/#{$secret.user}/.gem"

template "/home/#{$secret.user}/.gem/credentials" do
  mode "0600"
  source "templates/gem/credentials"
end
