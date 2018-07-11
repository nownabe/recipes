dest = "/home/#{$secret.user}/src/github.com/google/protobuf"

git dest do
  repository "https://github.com/google/protobuf"
end

execute "Install protoc" do
  command <<-CMD
    cd #{dest}
    ./autogen.sh
    ./configure --prefix=${HOME}
    make
    make install
  CMD
  not_if "type protoc"
end
