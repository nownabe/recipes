%w(
  default-golang-pkgs
  default-npm-packages
  default-python-packages
).each do |name|
  link "#{home}/.#{name}" do
    to File.expand_path("../files/#{name}", __FILE__)
  end
end
