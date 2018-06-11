%w(
  build-essential
  libbz2-dev
  libgdbm-dev
  liblzma-dev
  libncurses5-dev
  libreadline-dev
  libssl-dev
  libsqlite3-dev
  tcl-dev
  tk-dev
  zlib1g-dev
).each do |pkg|
  package pkg do
    user "root"
  end
end
