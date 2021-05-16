directory "#{home}/.gem"

template "#{home}/.gem/credentials" do
  mode "0600"
  source "templates/gem/credentials"
end

link "#{home}/.rubocop.yml" do
  to File.expand_path("../files/rubocop.yml", __FILE__)
end
