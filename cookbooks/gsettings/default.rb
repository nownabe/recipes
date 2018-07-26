execute "Replace CapsLock with Ctrl" do
  command 'gsettings set org.gnome.desktop.input-sources xkb-options "[\'ctrl:nocaps\']"'
  not_if '[ "$(gsettings get org.gnome.desktop.input-sources xkb-options)" = "[\'ctrl:nocaps\']" ]'
end
