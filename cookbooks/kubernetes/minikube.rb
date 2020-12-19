%w(
  libvirt-clients
  libvirt-daemon-system
  qemu-kvm
).each do |pkg|
  package(pkg) { user "root" }
end

execute "Modify user for libvirt" do
  user "root"
  command "usermod -a -G libvirt #{$secret.user}"
  not_if "id #{$secret.user} | grep -q libvirt"
end

minikube_url = "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
minikube_path = "#{home}/bin/minikube"

execute "Install minikube" do
  command <<-CMD
    curl -LSs -o #{minikube_path} #{minikube_url}
    chmod +x #{minikube_path}
  CMD
  not_if "[ -x #{minikube_path} ]"
end

kvm2_url = "https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2"
kvm2_path = "#{home}/bin/docker-machine-driver-kvm2"

execute "Install KVM2 driver" do
  command <<-CMD
    curl -LSs -o #{kvm2_path} #{kvm2_url}
    chmod +x #{kvm2_path}
  CMD
  not_if "[ -x #{kvm2_path} ]"
end
