:set relativenumber
:set number
:set autoindent
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set smarttab
:set mouse=a
:set updatetime=100
:set expandtab
:set nohlsearch
:set cursorline
:set splitbelow
:set splitright
:set nowrap

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/f-person/git-blame.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mtdl9/vim-log-highlighting'

call plug#end()

let g:gitblame_enabled = 0

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

colorscheme gruvbox
 let g:gruvbox_contrast_light="soft"
 set bg=dark
" hi Normal guibg=NONE ctermbg=NONE
set ttimeoutlen=150
let g:airline#extensions#branch#enabled=1
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-java-vimspector',
    \]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:vimspector_enable_mapping = 'HUMAN'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

inoremap jj <ESC>
inoremap jl <ESC>la
inoremap hl <return><ESC>O
nmap io o<ESC>O



nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap ;; :update<cr>

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

vnoremap <C-c> "*y

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]
