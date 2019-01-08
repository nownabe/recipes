%w(
  golang.org/x/tools/cmd/goimports
  golang.org/x/vgo
  github.com/go-delve/delve/cmd/dlv
  github.com/go-swagger/go-swagger/cmd/swagger
  github.com/golang/dep/cmd/dep
  github.com/golang/protobuf/protoc-gen-go
  github.com/kubernetes-sigs/kustomize
  github.com/motemen/ghq
  github.com/nsf/gocode
  github.com/sourcegraph/go-langserver
).each do |pkg|
  execute "Install #{pkg}" do
    command $anyenv_cmd.call("GOPATH=${HOME} go get -u #{pkg}")
    not_if  "[ -e ${HOME}/src/#{pkg} ]"
  end
end
