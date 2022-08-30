# TODO: merge these lists

build_essentials = %w(
  autoconf
  bison
  build-essential
  clang
  cmake
  curl
  libbz2-dev
  libc++1
  libc++abi1
  libcurl4-openssl-dev
  libffi-dev
  libgdbm-dev
  libgtk-3-dev
  libicu-dev
  liblzma-dev
  libmysqlclient-dev
  libncurses5-dev
  libopenblas-dev
  libpq-dev
  libreadline-dev
  libssh2-1-dev
  libssl-dev
  libsqlite3-dev
  libtool
  ninja-build
  p7zip
  p7zip-full
  python3-pip
  tcl-dev
  tk-dev
  zlib1g-dev
)

packages = [
  "apache2-utils",          # Apache HTTP Server (utility programs for web servers)
  "asunder",                # graphical audio CD ripper and encoder
  "avr-libc",               # Standard C library for Atmel AVR development
  "avrdude",                # software for programming Atmel AVR microcontrollers
  "bat",                    # cat(1) clone with syntax highlighting and git integration
  "binutils-arm-none-eabi", # GNU assembler, linker and binary utilities for ARM Cortex-A/R/M processors
  "binutils-avr",           # Binary utilities supporting Atmel's AVR targets
  "blueman",                # Graphical bluetooth manager
  "byobu",                  # text window manager, shell multiplexer, integrated DevOps environment
  "cdrdao",                 # records CDs in Disk-At-Once (DAO) mode
  "chromium-chromedriver",  # WebDriver driver for the Chromium Browser
  "clang-format",           # Tool to format C/C++/Obj-C code
  "convmv",                 # filename encoding conversion tool
  "cppcheck",               # tool for static C/C++ code analysis (CLI)
  "cue2toc",                # converts CUE files to cdrdao's TOC format
  "deluge",                 # bittorrent client written in Python/PyGTK
  "dfu-programmer",         # device firmware update (DFU) based USB programmer for Atmel chips
  "dfu-util",               # Device firmware update (DFU) USB programmer
  "exfat-fuse",             # read and write exFAT driver for FUSE
  "exfat-utils",            # utilities to create, check, label and dump exFAT filesystem
  "fcitx",                  # Flexible Input Method Framework
  "fcitx-mozc",             # Mozc engine for fcitx - Client of the Mozc input method
  "ffmpeg",                 # Tools for transcoding, streaming and playing of multimedia files
  "flameshot",              # Powerful yet simple-to-use screenshot software
  "gcc-arm-none-eabi",      # GCC cross compiler for ARM Cortex-A/R/M processors
  "gcc-avr",                # GNU C compiler (cross compiler for avr)
  "ghex",                   # GNOME Hex editor for files
  "graphviz",               # rich set of graph drawing tools
  "gthumb",                 # image viewer and browser
  "jq",                     # lightweight and flexible command-line JSON processor
  "lame",                   # MP3 encoding library (frontend)
  "lhasa",                  # lzh archive decompressor
  "libgd-dev",              # GD Graphics Library (development version)
  "libnewlib-arm-none-eabi", # C library and math library compiled for bare metal using Cortex A/R/M
  "libonig-dev",            # regular expressions library — development files
  "libxml2-dev",            # Development files for the GNOME XML library
  "libzip-dev",             # library for reading, creating, and modifying zip archives (development)
  "mysql-client",           # MySQL database client (metapackage depending on the latest version)
  "nasm",                   # General-purpose x86 assembler
  "nfs-common",             # NFS support files common to client and server
  "nkf",                    # Network Kanji code conversion Filter
  "okteta",                 # hexadecimal editor for binary files
  "openjdk-11-jdk",         # OpenJDK Development Kit (JDK)
  "pinta",                  # Simple drawing/painting program
  "postgresql",
  "re2c",                   # tool for generating fast C-based recognizers
  "rpm",                    # package manager for RPM
  "shellcheck",             # lint tool for shell scripts
  "silversearcher-ag",      # very fast grep-like program, alternative to ack-grep
  "tree",                   # displays an indented directory tree, in color
  "xdg-utils",              # desktop integration utilities from freedesktop.org
  "webp",                   # Lossy compression of digital photographic images.
  "whois",                  # intelligent WHOIS client
  "xsel",                   # command-line tool to access X clipboard and selection buffers
]

(build_essentials + packages).each do |pkg|
  package pkg do
    user "root"
  end
end
