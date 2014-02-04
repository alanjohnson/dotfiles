"---------------- Initialization -----------------"
set nocompatible                  " This option stops vim from behaving in a strongly vi -compatible way. It should be at the start of any vimrc file as it can affect lots of other options which you may want to override.
set title                         " titlebar support

"set termencoding=utf-8
"scriptencoding utf-8             " Set script language
set encoding=utf-8                " sets how vim shall represent characters internally. Utf-8 is necessary for most flavors of Unicode.
"set fileencodings=utf-8,latin1    " sets the encoding for a particular file (local to buffer)
"set fillchars+=stl:\ ,stlnc:\     " disable statusline fillchars

set fileformats=unix,dos,mac      " Set file end-of-line priority. support all three newline formats
"behave mswin                     " Set mouse behaviour to be like the OS's.
set shell=/bin/bash\ -l           " set it to use bash_profile for aliases
let mapleader = ","               " set leaderkey to a comma - The default leader is '\', but many people prefer ',' as it's in a easier to get location
let maplocalleader=','            " same as above? setting leaderkey (all my macros start with ,)
" Setup Bundle Support - The next two lines ensure that the ~/.vim/bundle/ system works
cd ~/Sites/                       " Set the current/startup folder to something useful
"---------------------- END ----------------------"
"
"
"
"---------------- Plugin Settings ----------------"
" PATHOGEN
runtime! autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#runtime_append_all_bundles()
"Must run helptags AFTER pathogen#runtime_append_all_bundles() to form tags properly.
silent! call pathogen#helptags()  " better to call this in update-bundles

" NERD Tree
au BufEnter * lcd %:p:h         " set nerdtree to open in the current files folder
au VimEnter *  NERDTree         " open nerd tree on startup
map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1     " display the bookmarks table on startup.
let NERDTreeShowFiles=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeAutoCenter=1
let NERDChristmasTree=1
autocmd VimEnter * NERDTree

" POWERLINE - Status line plugin settings
let g:Powerline_symbols = 'fancy'
set laststatus=2                  " Always show statusline, even if only 1 window.
"---------------------- END ----------------------"
"
"
"
"------------ Windows Compatibility --------------"
if has('win32') || has('win64')
	set guifont=Droid_Sans_Mono:h10:cANSI
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization across (heterogeneous) systems easier.
  set term=$TERM                  " Make arrow and other keys work
endif
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
"---------------------- END ----------------------"
"
"
"
"
"------------ Setting up the visuals -------------"
"color solarized  
set guifont=Courier_New:h16       " set font and font size
"set guifont=Terminus\ 9          " I hear this is a great font, need to check it out.
"set guifont=ProggyClean\ 12
syntax on
if has('syntax')
    syntax on                     " syntax highlighting on
    filetype on                   " Enable filetype detection
    filetype indent on            " Enable filetype-specific indenting
    filetype plugin on            " Enable filetype-specific plugins
    if &term == 'rxvt-unicode'    " Remember that rxvt-unicode has 88 colors by default; enable this only if you are using the 256-color patch
        set t_Co=256              " add the 256 color setting
    endif

    if &t_Co == 256
        colorscheme twilight256
        "colorscheme solarized      " load a colorscheme
    else
        colorscheme twilight
        "colorscheme solarized      " load a colorscheme
    endif
endif

if has('statusline')
  "set laststatus=2                  " Always show statusline, even if only 1 window.
  "Status line gnarliness
  "set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
endif
"---------------------- END ----------------------"
"
"
"
"------ Text editing and searching behavior ------"
set whichwrap=b,s,h,l,<,>,[,]     " backspace and cursor keys can wrap to lines
set virtualedit=onemore           " allow for cursor beyond last character
"set virtualedit=block            " Let cursor move past the last char in <C-v> mode
set hlsearch                      " highlight the search
"set nohlsearch                    " turn off highlighting for searched expressions
set incsearch                     " incremental search, highlight matches as you type your search phrase
set mouse=a                       " try to use a mouse in the console (wimp!)
set nomousehide                   " don't hide cursor
set ignorecase                    " search with case insensitivity
set smartcase                     " unless there's a capital letter in regex
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options (preview=Don't show preview menu for tags)
"set infercase                     " Try to adjust insert completions for case.
set nostartofline                 " leave my cursor position alone! Avoids moving cursor to BOL on move
set backspace=2                   " allow backspacing over anything - equiv to :set backspace=indent,eol,start
set textwidth=80                  " we like 80 columns
set showmatch                     " show matching brackets
set matchtime=5                   " blink matching chars for .x seconds
set diffopt=filler,iwhite         " ignore all whitespace and sync
"set scrolloff=3                   " keep at least 5 lines around the cursor
"set sidescrolloff=3               " keep at least 5 lines left/right
" Search mappings: These will make it so that going to the next one in a search will center  the screen on the line it's found in.
map N Nzz
map n nzz
"---------------------- END ----------------------"
"
"
"
"---------------- Text Formatting ---------------"
set formatoptions=t               " t - autowrap to textwidth
set formatoptions+=c              " c - autowrap comments to textwidth
set formatoptions+=r              " r - autoinsert comment leader with <Enter>
set formatoptions+=q              " q - allow formatting of comments with :gq
set formatoptions+=n              " n - gq recognizes numbered lists
set formatoptions+=l              " l - (letter l) don't format already long lines
set formatoptions+=1              " 1 - (number one) try to break before, not after, a 1 letter word
"---------------------- END ----------------------"
"
"
"
"---------------- Windows and Buffers ---------------"
set nohidden                      " When I close a tab, remove the buffer
"set hidden                       " hide buffer, don't close it.
set noequalalways                 " Don't keep resizing all windows to the same size
"set swb=useopen,usetab            " Allow changing tabs/windows for quickfix/:sb/etc
set splitright                    " New windows open/split to the right of the current one
"---------------------- END ----------------------"
"
"
"
"---------------- Indents and tabs ---------------"
set autoindent                    " set the cursor at same indent as line above, when no filetype is set
set smartindent                   " try to be smart about indenting (C-style)
set expandtab                     " Use spaces, not tabs, for autoindent/tab key.
"set smarttab                     " tab and backspace are smart
set shiftwidth=2                  " spaces for each step of (auto)indent
set softtabstop=2                 " set virtual tab stop (compat for 8-wide tabs) - <BS> over an autoindent deletes both spaces.
set tabstop=2                     " for proper display of files with tabs = number of spaces a tab has (normal tab is 8, but I like 2 if I see tabs- since I use 2 spaces - not tabs - as per SASS/HAML)
"set shiftround                   " always round indents to multiple of shiftwidth
"set copyindent                   " use existing indents for new indents
"set preserveindent               " save as much indent structure as possible
"---------------------- END ----------------------"
"
"
"
"----------- Console UI & Text display -----------"
set lazyredraw                    " don't redraw while in macros
set nowrap                        " do not wrap line
"set wrap                         " soft wrap long lines
"set linebreak                    " wrap at a blank character
set list                          " show invisible character - show tabs using settings below, good to show to ensure they dont exist if unwanted
set listchars=tab:>.,trail:.,extends:#,nbsp:. " but only show tabs and trailing whitespace / problematic whitespace
set wildmenu                      " turn on wild menu :e <Tab ->show list instead of just completing
set wildmode=list:longest,full    " command <Tab> completion, set wildmenu to list choice, then longest common part, then all.
set number                        " turn on line numbers
set numberwidth=5                 " We are good up to 99999 lines
set cursorline                    " highlight current line
" set cursorcolumn                " highlight current line
"hi cursorline guibg=#333333      " highlight bg color of current line
"hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white " set bg and font color for column highlighting
"hi CursorColumn guibg=#333333    " highlight cursor
"hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white " set bg and font color for column highlighting
set autochdir                     " always switch to the current file directory - Messes with some plugins, best left commented out and use next line instead
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " If you use command-t plugin, it conflicts with this, comment it out.
set background=dark               " we plan to use a dark background
set tabpagemax=15                 " only show 15 tabs
set linespace=0                   " No extra spaces between rows
set winminheight=0                " windows can be 0 line high
"set scrolljump=3                 " lines to scroll when cursor leaves screen
"set scrolloff=3                    " minimum lines to keep above and below cursor
"set gdefault                     " the /g flag on :s substitutions by default
"---------------------- END ----------------------"
"
"
"
"----------------- Message / Info / Status ------------------"
set confirm                       " Y-N-C prompt if closing with unsaved changes.
"set report=0                     " report back on all changes - commands always print changed line count.
"set shortmess=atI                " shorten messages and don't show intro
set shortmess+=filmnrxoOtT        " abbrev. of messages (avoids 'hit enter')
if has('cmdline_info')
  set ruler                       " show the ruler - Always show current positions along the bottom
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                     " This shows what you are typing as a command.  I love this! - show partial commands in status line and selected characters/lines in visual mode
  "set cmdheight=1                " explicitly set the height of the command line
  set statusline=%<%f\            " Filename
  set statusline+=%w%h%m%r        " Options
  "set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]   " filetype
  set statusline+=\ [%{getcwd()}] " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif
set visualbell t_vb=              " turn off visual error bells
"---------------------- END ----------------------"
"
"
"
"----------------- Folding ------------------"
set nofoldenable                  " disable code folding
"set foldenable                    " auto fold code
"set foldmethod=indent
"set foldnestmax=10
"set nofoldenable
"set foldlevel=1
"set foldmethod=syntax             " By default, use syntax to determine folds
"set foldlevelstart=99             " All folds open by default
"---------------------- END ----------------------"
"
"
"
"----------------- GUI Settings ------------------"
if has("gui_running")             " only set this color in gvim
  colorscheme twilight
  "colorscheme solarized            " load a colorscheme
  set transparency=4              " add some transparency
  " The following is a hack to fix a vim bug
  set guioptions+=LlRrbmT         "no scrollbar Hack
  set guioptions-=LlRrbmT         "no scrollbar Hack
  " END Hack
  set guioptions-=T               " remove the toolbar
  set lines=40                    " 40 lines of text instead of 24,
endif
"---------------------- END ----------------------"
"
"
"
"----------------- Key Mappings ------------------"
" Stupid shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
nmap <silent> <leader>ev :e $MYVIMRC<CR>    "edits the .vimrc file
nmap <silent> <leader>rv :so $MYVIMRC<CR>   "reloads the .vimrc file
map <S-Insert> <MiddleMouse>      "middle mouse button pastes

" shift up/down is page up/down
noremap <S-j> <C-f>
noremap <S-k> <C-b>

" shift left/right is word left/right
noremap <S-h> b
noremap <S-l> w
" Fuzzy Finder file mode
map <C-f> :FufFile <CR>
imap ;; <Esc>

" Easier split navigation - Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" And to move the splits arround!
nmap <silent> <c-s-k> <C-W>k
nmap <silent> <c-s-j> <C-W>j
nmap <silent> <c-s-h> <C-W>h
nmap <silent> <c-s-l> <C-W>l

" alt+arrow to move between tabs
map <A-left> :tabp<CR>
map <A-right> :tabn<CR>

"---------------------- END ----------------------"
"
"
"
"--------------------- Misc ----------------------"
"set lines=80
"set columns=200


highlight Normal ctermfg=gray ctermbg=black


" Search for word under cursor in current DIRECTORY and all sub directories
map <F4> :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"noautocmd vimgrep /word/j **

" Use english for spellchecking, but don't spellcheck by default
set spell                      " spell checking on
if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en " Enable spell check for text files
  set nospell
endif

"set more                       " use more prompt
set showmode                    " show what mode you're in (i.e. visual)
"set updatecount=100            " switch every 100 chars
"set complete=.,w,b,u,U,t,i,d   " do lots of scanning on tab completion
"set ttyfast                    " we have a fast terminal
"set ff=unix
"imap ii <C-[> " hit i twice in a row, and it will go back ot command mode (i to enter edit mode, i again to go back = handy).
"set noerrorbells "Turn off error bells
"---------------------- END ----------------------"
"
"
"
"
"-------------------- Reading/Writing ---------------------"
set autoread                    " watch for file changes
"set noautoread                  " Don't automatically re-read changed files.
"set autowrite                   " automatically write a file when leaving a modified buffer
set noautowrite                 " Never write a file unless I request it, don't automagically write on :next
set noautowriteall              " NEVER EVER.
set modeline                    " Allow vim options to be embedded in files;
set modelines=5                 " they must be within the first or last 5 lines.
set ffs=unix,dos,mac            " Try recognizing dos, unix, and mac line endings.
"---------------------- END ----------------------"
"
"
"
"
"-------------------- BACKUP / UNDO / SWAP---------------------"
" First, Create directories if they don't exist
silent execute '!mkdir -p $HVOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'
silent !mkdir $HOME/.vimbackup// > /dev/null 2>&1 " make it if it's not there
silent !mkdir $HOME/.vimswap// > /dev/null 2>&1 " make it if it's not there
silent !mkdir $HOME/.vimviews// > /dev/null 2>&1 " make it if it's not there

"set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1
set writebackup                 " Make a backup of the original file when writing
"set nobackup                   " Turn off auto-backup, never back up from those files anyway
set backup                      " backups are nice ... don't auto-delete it after a succesful write.
set backupskip=                 " There are no files that shouldn't be backed up.
set updatetime=5000             " Write swap files after 5 seconds of inactivity.
set backupext=~                 " Backup for 'file' is 'file~'
"set backupdir^=~/.backup        " NOt this, use below for mac and PC compatibility - Backups are written to ~/.backup/ if possible.
set backupdir=$HOME/.vimbackup// " set up backup directories to ~/.backup/ on mac, shoudl also handle PC folder structure
set history=1000                " Store a ton of history (default is 20)
set undofile                    " persistent undo is nice...
set undolevels=1000             " maximum number of changes that can be undone
set undoreload=10000            " maximum number lines to save for undo on a buffer reload
set dir=$HOME/.vimswap//,/var/tmp//,/tmp//,.    "Same for swap files
set viewdir=$HOME/.vimviews//                   " same for view files

au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
"---------------------- END ----------------------"
"
"
"
"
"----------- Filetype specific settings ----------"
"" Vimscript
"autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
"" Shell
"autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
"" Lisp
"autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2
"" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"" PHP
"autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"" X?HTML & XML
"autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"" CSS
"autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"" JavaScript
"" autocmd BufRead,BufNewFile *.json setfiletype javascript
"autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"let javascript_enable_domhtmlcss=1
"---------------------- END ----------------------"
"
"
"
"
"
"comment out line(s) in visual mode -RB: If you do this, you can't
"switch sides of the comment block in visual mode.
"vmap o :call NERDComment(1, 'toggle')<CR>
let g:NERDShutUp=1

let b:match_ignorecase = 1
" }
" ShowMarks {
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" }
" Command-t {
        let g:CommandTSearchPath = $HOME . '/Code'
" }


" Use local vimrc if available {
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }

