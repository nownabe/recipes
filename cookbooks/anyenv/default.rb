git "/home/#{$secret.user}/.anyenv" do
  repository "https://github.com/riywo/anyenv.git"
end

git "/home/#{$secret.user}/.anyenv/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update.git"
end
