%w(
  build-essential
  libreadline-dev
  libssl-dev
  zlib1g-dev
).each do |pkg|
  package pkg do
    user "root"
  end
end
