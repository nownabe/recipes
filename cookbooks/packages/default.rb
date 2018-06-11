[
  "byobu", # text window manager, shell multiplexer, integrated DevOps environment
  "fcitx", # Flexible Input Method Framework
  "fcitx-mozc", # Mozc engine for fcitx - Client of the Mozc input method
  "pinta", # Simple drawing/painting program
].each do |pkg|
  package pkg do
    user "root"
  end
end
