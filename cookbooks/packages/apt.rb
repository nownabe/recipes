["byobu", # text window manager, shell multiplexer, integrated DevOps environment\
 "fcitx", # Flexible Input Method Framework\
 "fcitx-mozc", # Mozc engine for fcitx - Client of the Mozc input method\
 "graphviz", # rich set of graph drawing tools\
 "nfs-common", #  NFS support files common to client and server\
 "pinta", # Simple drawing/painting program\
 "silversearcher-ag", # very fast grep-like program, alternative to ack-grep\
 "xdg-utils", # desktop integration utilities from freedesktop.org\
 "webp" # Lossy compression of digital photographic images.\
].each do |pkg| package pkg do user "root" end end
