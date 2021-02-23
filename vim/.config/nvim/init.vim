colorscheme gruvbox

lua require 'init'


let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"

command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"
"---------------------------------------------------------------------------------------------------
" Key Remappings
"---------------------------------------------------------------------------------------------------
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
  " open a terminal buffer on the bottom
  nnoremap <leader>q :bo 20sp +te <CR>
endif

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let g:fzf_layout = { 'down': '~80%' }
nmap // :BLines!<CR>

nmap ?? :Rg!<CR>

nmap <leader>p :Files!<CR>

nmap cc :Commands!<CR>

nmap <leader>n :NERDTreeToggle<CR>
imap <silent> <c-Space> <Plug>(completion_trigger)

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
command! Format execute 'lua vim.lsp.buf.formatting()'
