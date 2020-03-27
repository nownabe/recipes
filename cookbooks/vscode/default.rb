url = "https://go.microsoft.com/fwlink/?LinkID=760868"

package_path = File.join($tmpdir, "visualstudiocode.rb")
check_installation = "dpkg-query -f '${Status}' -W code | grep -q 'install ok installed'"

execute "Download Visual Studio Code" do
  command "curl -L -o #{package_path} '#{url}'"
  not_if "[ -e #{package_path} ] || #{check_installation}"
end

execute "Install Visual Studio Code" do
  user "root"
  command "dpkg -i #{package_path}"
  not_if check_installation
end

directory "/home/#{$secret.user}/.config/Code/User"

link "/home/#{$secret.user}/.config/Code/User/settings.json" do
  to File.expand_path("../files/settings.json", __FILE__)
end

link "/home/#{$secret.user}/.config/Code/User/keybindings.json" do
  to File.expand_path("../files/keybindings.json", __FILE__)
end

%w(
  42Crunch.vscode-openapi
  CoenraadS.bracket-pair-colorizer
  DavidAnson.vscode-markdownlint
  Tyriar.terminal-tabs
  VisualStudioExptTeam.vscodeintellicode
  bung87.rails
  dbaeumer.vscode-eslint
  eg2.tslint
  esbenp.prettier-vscode
  gerane.Theme-Dark-Dracula
  kaiwood.endwise
  mechatroner.rainbow-csv
  mermade.openapi-lint
  ms-vscode.Go
  ninoseki.vscode-gem-lens
  oderwat.indent-rainbow
  philosowaffle.openapi-designer
  rebornix.ruby
  steoates.autoimport
  vortizhe.simple-ruby-erb
  vscodevim.vim
).each do |ext|
  execute "Install VS Code extension #{ext}" do
    command "code --force --install-extension #{ext}"
    not_if "code --list-extensions | grep -q '#{ext}'"
  end
end
