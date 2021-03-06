%w(
  vlc
).each do |pkg|
  execute "Install #{pkg} snap" do
    user "root"
    command "snap install #{pkg}"
    not_if "snap list #{pkg}"
  end
end

%w(
  heroku
  flutter
).each do |pkg|
  execute "Install #{pkg} snap" do
    user "root"
    command "snap install --classic #{pkg}"
    not_if "snap list #{pkg}"
  end
end
