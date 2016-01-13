set nocompatible              " be iMproved, required
filetype off                  " required

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
call vundle#end()            " required
filetype plugin indent on    " iequired

colorscheme jellybeans  
set t_Co=256

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let mapleader = "\<Space>"
nmap 0 ^
imap jk <esc>:w<CR>
imap kj <esc>:w<CR>
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>rs :%s/\s\+$//<cr>
nmap <leader>w :w<cr>
nnoremap :Q<CR> :q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" set soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "call VtrSendCommand!('rspec {spec}')"

" VTR shortcuts
map <Leader>slr :VtrSendLinesToRunner!<CR>
map <Leader>ap :VtrAttachToPane<CR>
map <Leader>sfr :VtrSendFile!<CR>
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
