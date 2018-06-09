package "fcitx-mozc" do
  user "root"
  options "--install-recommends"
end

execute "Set imput method to mozc" do
  command "im-config -n fcitx"
  not_if "im-config -m | grep -q fcitx"
end
