syntax enable
filetype plugin indent on

set backspace=indent,eol,start
set relativenumber
set hls
set ignorecase
set incsearch
set wildmenu
set cmdheight=2
set tabstop=4 softtabstop=4
set expandtab
set background=dark
set autoread
set mouse=a

colorscheme gruvbox
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
let g:mapleader = ","

command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
"---------------------------------------------------------------------------------------------------
" Key Remappings
"---------------------------------------------------------------------------------------------------
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let g:fzf_layout = { 'down': '~80%' }
nmap // :BLines!<CR>

nmap ?? :Rg!<CR>

nmap <leader>p :Files!<CR>

nmap cc :Commands!<CR>
