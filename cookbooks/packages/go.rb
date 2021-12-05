raise "Remove this file. Use $HOME/.default-golang-pkgs. https://github.com/kennyp/asdf-golang#default-go-get-packages"

#  github.com/go-swagger/go-swagger/cmd/swagger
#  github.com/kubernetes-sigs/kustomize
%w(
  golang.org/x/tools/cmd/goimports
  golang.org/x/vgo
  github.com/go-delve/delve/cmd/dlv
  github.com/golang/dep/cmd/dep
  github.com/golang/protobuf/protoc-gen-go
  github.com/x-motemen/ghq
  github.com/nsf/gocode
  github.com/sourcegraph/go-langserver
).each do |pkg|
  execute "Install #{pkg}" do
    command $anyenv_cmd.call("GO111MODULE=off GOPATH=${HOME} go get -u #{pkg}")
    not_if  "[ -e ${HOME}/src/#{pkg} ]"
  end
end
