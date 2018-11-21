[
  "apache2-utils",     # Apache HTTP Server (utility programs for web servers)
  "byobu",             # text window manager, shell multiplexer, integrated DevOps environment
  "cdrdao",            # records CDs in Disk-At-Once (DAO) mode
  "deluge",            # bittorrent client written in Python/PyGTK
  "exfat-fuse",        # read and write exFAT driver for FUSE
  "exfat-utils",       # utilities to create, check, label and dump exFAT filesystem
  "fcitx",             # Flexible Input Method Framework
  "fcitx-mozc",        # Mozc engine for fcitx - Client of the Mozc input method
  "graphviz",          # rich set of graph drawing tools
  "jq",                # lightweight and flexible command-line JSON processor
  "mysql-client",      # MySQL database client (metapackage depending on the latest version)
  "nfs-common",        # NFS support files common to client and server
  "openjdk-11-jdk",    # OpenJDK Development Kit (JDK)
  "p7zip",             # 7zr file archiver with high compression ratio
  "p7zip-full",        # 7z and 7za file archivers with high compression ratio
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
