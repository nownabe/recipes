directory "#{home}/.gem"

template "#{home}/.gem/credentials" do
  mode "0600"
  source "templates/gem/credentials"
end
