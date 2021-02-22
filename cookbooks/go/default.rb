golangci_lint_version = "1.12.3"

golangci_lint_check_command = <<CMD
  [ -x #{home}/bin/golangci-lint ] && \
  golangci-lint --version | grep -q #{golangci_lint_version}
CMD

execute "Install golangci-lint" do
  command <<-CMD
    curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
    | sh -s -- -b $HOME/bin v#{golangci_lint_version}
  CMD
  not_if golangci_lint_check_command
end
