%w(
  github.com/motemen/ghq
).each do |pkg|
  execute "Install #{pkg}" do
    command $anyenv_cmd.call("GOPATH=${HOME} go get -u #{pkg}")
    not_if  "[ -e ${HOME}/src/#{pkg} ]"
  end
end
