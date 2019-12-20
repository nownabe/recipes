[
  ["stable", "https://kubernetes-charts.storage.googleapis.com/"]
].each do |repo|
  execute "Install Helm repository: #{repo[0]}" do
    command "helm repo add #{repo[0]} #{repo[1]}"
    not_if "helm repo list | grep -q #{repo[0]}"
  end
end
