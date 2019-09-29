[
  "apache2-utils",     # Apache HTTP Server (utility programs for web servers)
  "asunder",           # graphical audio CD ripper and encoder
  "avr-libc",          # Standard C library for Atmel AVR development
  "avrdude",           # software for programming Atmel AVR microcontrollers
  "binutils-arm-none-eabi", # GNU assembler, linker and binary utilities for ARM Cortex-A/R/M processors
  "binutils-avr",      # Binary utilities supporting Atmel's AVR targets
  "blueman",           # Graphical bluetooth manager
  "byobu",             # text window manager, shell multiplexer, integrated DevOps environment
  "cdrdao",            # records CDs in Disk-At-Once (DAO) mode
  "chromium-chromedriver", # WebDriver driver for the Chromium Browser
  "cue2toc",           # converts CUE files to cdrdao's TOC format
  "deluge",            # bittorrent client written in Python/PyGTK
  "dfu-programmer",    # device firmware update (DFU) based USB programmer for Atmel chips
  "dfu-util",          # Device firmware update (DFU) USB programmer
  "exfat-fuse",        # read and write exFAT driver for FUSE
  "exfat-utils",       # utilities to create, check, label and dump exFAT filesystem
  "fcitx",             # Flexible Input Method Framework
  "fcitx-mozc",        # Mozc engine for fcitx - Client of the Mozc input method
  "ffmpeg",            # Tools for transcoding, streaming and playing of multimedia files
  "gcc-arm-none-eabi", # GCC cross compiler for ARM Cortex-A/R/M processors
  "gcc-avr",           # GNU C compiler (cross compiler for avr)
  "ghex",              # GNOME Hex editor for files
  "graphviz",          # rich set of graph drawing tools
  "jq",                # lightweight and flexible command-line JSON processor
  "lame",              # MP3 encoding library (frontend)
  "lhasa",             # lzh archive decompressor
  "libnewlib-arm-none-eabi", # C library and math library compiled for bare metal using Cortex A/R/M
  "mysql-client",      # MySQL database client (metapackage depending on the latest version)
  "nasm",              # General-purpose x86 assembler
  "nfs-common",        # NFS support files common to client and server
  "nkf",               # Network Kanji code conversion Filter
  "openjdk-11-jdk",    # OpenJDK Development Kit (JDK)
  "pinta",             # Simple drawing/painting program
  "rpm",               # package manager for RPM
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
