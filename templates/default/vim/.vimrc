" personal vim profile
" Heavily influenced by the example at:
" http://vim.wikia.com/wiki/Example_vimrc

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Determine the filetype based on its name / contents.
" Allows intelligent auto-indenting for each filetype,
" Allows plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on.
" Useful for READMEs, etc.
set autoindent

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search,
" except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent,
" line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen
" or in the status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes,
" raise a dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
" Turn off flashing and beeping
set visualbell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines.
" avoid many cases of "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Convert tabs to spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Redraw the screen
" Turn off highlighting until next search
nnoremap <C-L> :nohl<CR><C-L>

" Home Row Reinforcement
" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
