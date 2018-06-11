[
  "byobu", # text window manager, shell multiplexer, integrated DevOps environment
  "fcitx", # Flexible Input Method Framework
  "fcitx-mozc", # Mozc engine for fcitx - Client of the Mozc input method
  "pinta", # Simple drawing/painting program
  "silversearcher-ag", # very fast grep-like program, alternative to ack-grep
].each do |pkg|
  package pkg do
    user "root"
  end
end
