%w(
  autoconf
  bison
  build-essential
  libbz2-dev
  libcurl4-openssl-dev
  libgdbm-dev
  liblzma-dev
  libmysqlclient-dev
  libncurses5-dev
  libopenblas-dev
  libpq-dev
  libreadline-dev
  libssl-dev
  libsqlite3-dev
  libtool
  tcl-dev
  tk-dev
  zlib1g-dev
).each do |pkg|
  package pkg do
    user "root"
  end
end
