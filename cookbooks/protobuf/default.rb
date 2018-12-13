grpc_web_version = "1.0.3"


# --------


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

grpc_web_url = "https://github.com/grpc/grpc-web/releases/download/#{grpc_web_version}/protoc-gen-grpc-web-#{grpc_web_version}-linux-x86_64"
grpc_web_path = "/home/#{$secret.user}/bin/protoc-gen-grpc-web"

execute "Install grpc-web" do
  command <<-CMD
    curl -LSs -o #{grpc_web_path} #{grpc_web_url}
    chmod +x #{grpc_web_path}
  CMD
  not_if "[ -x #{grpc_web_path} ]"
end
