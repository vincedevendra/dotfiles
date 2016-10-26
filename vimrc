set nocompatible              " be iMproved, required
filetype off                  " required

runtime macros/matchit.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'JamshedVesuna/vim-markdown-preview'
  Plugin 'janko-m/vim-test'
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
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-vinegar'
call vundle#end()            " required
filetype plugin indent on    " iequired

syntax on

" show line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
colorscheme jellybeans
set t_Co=256

" show trailling whitsepace
set list listchars=tab:»·,trail:·,nbsp:·

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" display syntax error warning in gutter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_elixir_checker = 1

set clipboard+=unnamed

let mapleader = "\<Space>"
nmap 0 ^
nmap 9 $
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>

"remove trailing whitespace and save
nmap <leader>rs :%s/\s\+$//<cr><leader>h:w<cr>

nmap <leader>w :w<cr>
nnoremap :Q<CR> :q<CR>

"easily navigate between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"easily create new panes
nnoremap <leader>\ :vsplit<cr>
nnoremap <leader>_ :split<cr>

"insert pry
nnoremap <leader>p orequire 'pry'; binding.pry<cr><esc>

"new line creation in normal mode
nmap <leader><CR> o<Esc>

"save on escape
imap <C-c> <C-c>:w<cr>

" set soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" panes rebalance to set size on focus
set winwidth=87
set winheight=5
set winminheight=5
set winheight=999

" vim-test shortcuts
let test#strategy = "vtr"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" VTR shortcuts
map <Leader>sl :VtrSendLinesToRunner!<CR>
map <Leader>ap :VtrAttachToPane<CR>
map <Leader>sf :VtrSendFile!<CR>
map <Leader>fr :VtrFocusRunner<CR>

" show relative line numbers and current line number
set number
set relativenumber
set numberwidth=5

" show 80 chars cutoff
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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
end

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>if
nnoremap \ :Ag<SPACE>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

 "automatically rebalance windows on vim resize
 autocmd VimResized * :wincmd =

 "zoom a vim pane, <C-w>= to re-balance
 nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
 nnoremap <leader>= :wincmd =<cr>
