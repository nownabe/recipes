[
  "apache2-utils",     # Apache HTTP Server (utility programs for web servers)
  "asunder",           # graphical audio CD ripper and encoder
  "byobu",             # text window manager, shell multiplexer, integrated DevOps environment
  "cdrdao",            # records CDs in Disk-At-Once (DAO) mode
  "cue2toc",           # converts CUE files to cdrdao's TOC format
  "deluge",            # bittorrent client written in Python/PyGTK
  "exfat-fuse",        # read and write exFAT driver for FUSE
  "exfat-utils",       # utilities to create, check, label and dump exFAT filesystem
  "fcitx",             # Flexible Input Method Framework
  "fcitx-mozc",        # Mozc engine for fcitx - Client of the Mozc input method
  "ghex",              # GNOME Hex editor for files
  "graphviz",          # rich set of graph drawing tools
  "jq",                # lightweight and flexible command-line JSON processor
  "lame",              # MP3 encoding library (frontend)
  "mysql-client",      # MySQL database client (metapackage depending on the latest version)
  "nasm",              # General-purpose x86 assembler
  "nfs-common",        # NFS support files common to client and server
  "nkf",               # Network Kanji code conversion Filter
  "openjdk-11-jdk",    # OpenJDK Development Kit (JDK)
  "pinta",             # Simple drawing/painting program
  "silversearcher-ag", # very fast grep-like program, alternative to ack-grep
  "tree",              # displays an indented directory tree, in color
  "xdg-utils",         # desktop integration utilities from freedesktop.org
  "webp",              # Lossy compression of digital photographic images.
  "whois",             # intelligent WHOIS client
].each do |pkg|
  package pkg do
    user "root"
  end
end
