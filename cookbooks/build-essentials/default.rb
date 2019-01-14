%w(
  autoconf
  bison
  build-essential
  cmake
  curl
  libbz2-dev
  libc++1
  libc++abi1
  libcurl4-openssl-dev
  libffi-dev
  libgdbm-dev
  libicu-dev
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
