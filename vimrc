set nocompatible              " be iMproved, required
filetype off                  " required

runtime macros/matchit.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'tpope/vim-rails'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'christoomey/vim-tmux-runner'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'tpope/vim-commentary'
  Plugin 'vim-airline/vim-airline'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'floobits/floobits-neovim'
  Plugin 'tacahiroy/ctrlp-funky'
  Plugin 'scrooloose/syntastic'
  Plugin 'skalnik/vim-vroom'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " iequired

syntax enable

let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
colorscheme jellybeans
set t_Co=256

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_elixir_checker = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

set clipboard+=unnamedplus
let mapleader = "\<Space>"
nmap 0 ^
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>rs :%s/\s\+$//<cr><leader>h:w<cr>
nmap <leader>w :w<cr>
nnoremap :Q<CR> :q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>\ :vsplit<cr>
nnoremap <leader>_ :split<cr>
nnoremap <leader>p irequire 'pry'; binding.pry<esc>
imap <C-c> <C-c>:w<cr>
" set soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set winwidth=87
set winheight=5
set winminheight=5
set winheight=999

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "call VtrSendCommand!('rspec {spec}')"

" VTR shortcuts
map <Leader>sl :VtrSendLinesToRunner!<CR>
map <Leader>ap :VtrAttachToPane<CR>
map <Leader>sf :VtrSendFile!<CR>
map <Leader>fr :VtrFocusRunner<CR>

set number
set relativenumber
set numberwidth=5
set colorcolumn=80
set textwidth=80

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set hlsearch
set ignorecase
set smartcase

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

 "automatically rebalance windows on vim resize
 autocmd VimResized * :wincmd =


 "zoom a vim pane, <C-w>= to re-balance
 nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
 nnoremap <leader>= :wincmd =<cr>
