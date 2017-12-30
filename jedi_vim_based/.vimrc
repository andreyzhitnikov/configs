" Jedi config 
" Author Andrey Zhitnikov
" based on
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012



"=====building vim==="
" for all question ./configure --help
"""""   --enable-pythoninterp=yes \
""""    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
"cd ~
""git clone https://github.com/vim/vim.git
"cd vim
"./configure --with-features=huge --enable-multibyte  --enable-rubyinterp=no \
"            --enable-python3interp=yes \
"            --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/\
"            --enable-perlinterp=yes \
"            --enable-luainterp=yes \
"            --enable-cscope \
"            --enable-gui=no\
"            --prefix=/home/$USER/installed/vim
"make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
"make VIMRUNTIMEDIR=/home/$USER/installed/vim/share/vim/vim74
"make VIMRUNTIMEDIR=/home/$USER/installed/vim/share/vim/vim80
"===================="




"let $PYTHONHOME='/usr/bin/python3.5'

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamedplus


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


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
"mkdir -p ~/.vim/colors && cd ~/.vim/colors
"wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and leng"
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags() 

" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
"cd ~/.vim/bundle
"git clone git://github.com/Lokaltog/vim-powerline.git
"git clone https://github.com/powerline/powerline.git
"git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
set laststatus=2



" Settings for ctrlp
"cd ~/.vim/bundle
"git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
"cd ~/.vim/bundle
"git clone https://github.com/klen/python-mode
"let g:pymode = 1
"let g:pymode_folding=1
"let g:pymode_doc =1
"let g:pymode_doc_bind="K"
 
"let g:pymode_rope_completion =1
"let g:pymode_rope_completion_bind = '<C-Space>'

"====run===="
"let g:pymode_run = 1
"let g:pymode_run_bind = '<leader>r'
"=========="

"====virtualenv=="
"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV
"=====breakpoints ===="
"let g:pymode_breakpoint = 1 
"let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = 'pdb.set_trace() # BREAKPOINT<C-c>'
"====================="
"

"===code checking==="
"let g:pymode_lint = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_unmodified = 1
"let g:pymode_lint_on_fly = 1
"================="
"
"===Rope support==="
"let g:pymode_rope =1
"=====comletion===="
"let g:pymode_rope_completion =1
"let g:pymode_rope_completion_bind = '<C-Space>'
"let g:pymode_rope_complete_on_dot = 1
"==================="


"====Refactoring==
"let g:pymode_rope_rename_bind = '<C-c>rr'

"===find definition="

"let g:pymode_rope_goto_definition_bind = '<C-c>g'
"let g:pymode_rope_goto_def_newwin = "vnew"


"let ropevim_enable_shortcuts = 1

"let g:pymode_rope_extended_complete = 1


"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"let g:pymode_python = 'python3'
map <Leader>b Opu.db #breakpoint

set completeopt=longest,menuone,preview

" Settings for jedi-vim
"cd ~/.vim/bundle
"git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first =0
let g:jedi#show_call_signatures=1
let g:jedi#auto_close_doc = 0
let g:jedi#force_py_version = 3

"map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim

function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"====syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_python_checkers=['pylint' , 'pylama', 'pep8']
let g:syntastic_python_pylint_exe = 'python3.4 -m pylint'
"================
" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"set nofoldenable
set foldmethod=indent
