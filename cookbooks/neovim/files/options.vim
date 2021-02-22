if has('multi_byte_ime')
  set iminsert=0
  set imsearch=0
endif

set title       " Show filename
set number      " Show line number
set ruler       " Show position of cursor
set smartindent " Auto indent
set autoindent  " Auto indent
set smarttab    " Smart auto indent
set expandtab   " Use spaces instead of TAB
set ignorecase  " Ignore case in search
set smartcase   " 検索文字列に大文字が含まれていたら区別
set wrapscan    " 最後まで検索したら最初に戻る
set incsearch   " Incremental search
set showmatch   " Emphasize brackets

set cmdheight=1     " height of command line
set laststatus=2    " ステータスラインをエディタウィンドウの末尾から1行目に常に表示

set tabstop=2     " Width of TAB
set shiftwidth=2  " 自動インデントの幅
set softtabstop=2 " 動く幅

" For Japanese IME
set ttimeout
set ttimeoutlen=50

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup

set backspace=indent,eol,start
