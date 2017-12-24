" --------------------------
" andreyz's .vimrc
" --------------------------

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


.
"map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/et number
"
so ~/.exrc
"
" Variable Settings
"
" Don't use vi-compatibility mode
set nocompatible
"
" Use the smart version of backspace
set backspace=2
"
"Tab-related settings
set expandtab
set shiftwidth=4
set smarttab
"
" Enable highlighting of misspelled terms
"set spell
"
" I like syntax highlighting
syntax on
"
" Always display row/column info 
set ruler
"
" Don't highlight all search terms, just find them
"set nohlsearch
set hlsearch
"
" Status line improvements from Kim Schultz ("Hacking Vim")
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
"
" Store backup files in a specific directory
" set backupdir=~/.backups
"
" Create backup files with a tilde extension, as 
" some sites seem to change this
set backupext=~
"
" Force creation of backup files 
set backup
"
" Use UTF-8 as the default text encoding
set encoding=utf-8
"
" Try to set right locale
try
	lang en_US
catch
endtry
"
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
"
" Set characters to show for trailing whitespace and 
" end-of-line. Also supports tab, but I set expandtab 
" and thus tabs are always turned into spaces.
set listchars=tab:>>,trail:!,eol:$
"
" --------------------------
"
" Specific settings for different types of files
"
" Settings for editing C files
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab
"
" ------------------------
"
" Key mappings
"
" Invoke ispell for spelling correction
"
map <F2> :w<CR>:!ispell -x %<CR>:e!<CR><CR>
"
" Re-source my vimrc, JIC
map <F4> :source $HOME/.vimrc<CR>
"
" Use F5 to reformat paragraphs
"map <F5> !}fmt <CR>
map <F5>  :let @/=""  <CR>

" The following emacs-like bindings are
" present because my fingers automatically
" type them, not because I think that 
" they're golden.
"
" Other window (emacs-like)
map <C-X>o <C-W>w
"
" Split screen horiz, prompt for file, and open
" ala gosmacs visit-file or GNU find-file-other-window
"
map <C-X><C-V> :sp 
"
" Buffer list (emacs-like)
map <C-X><C-B> :buffers<CR>
"
" Write current file/buffer ala emacs
map <C-X><C-W> :w<CR>
"
" --------------------------
"
" Functions
"
" Example from developerWorks:
"   http://www.ibm.com/developerworks/linux/library/l-vim-script-1
"
function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction
"
" Toggle syntax setting on/off
map <F4> :execute ToggleSyntax()<CR>
"
" Similar function for when syntax isn't relevant
function! ToggleColor()
	if &t_Co != 0
		set t_Co=0
	else  
		set t_Co=8
	endif
endfunction
"
" Toggle color on/off
map <F6> :execute ToggleColor()<CR>
