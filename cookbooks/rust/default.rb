installer = File.join($tmpdir, "rustup.sh")

execute "Install rustup" do
  command <<-CMD
    curl -o #{installer} --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs
    chmod +x #{installer}
    #{installer} -q -y --no-modify-path
  CMD
  not_if "[ -e $HOME/.cargo ]"
end

remote_file "/home/#{$secret.user}/.zsh.d/rust.zsh" do
  source "files/rust.zsh"
end
