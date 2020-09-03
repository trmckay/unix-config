set encoding=UTF-8
set nu
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set smartcase
set ignorecase
set incsearch
set autoindent
set autoread
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set undolevels=1000
set backspace=indent,eol,start
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
syntax on

call plug#begin()
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug '/usr/bin/fzf'
Plug 'sainnhe/forest-night'
Plug 'xarthurx/taskwarrior.vim'
call plug#end()

highlight clear SignColumn

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme="base16_ashes"
let g:airline_left_sep=""
let g:airline_right_sep=""

let mapleader = "\<Space>"

" Shortcuts for quitting
nnoremap <leader>Q <cmd>qa!<cr>
nnoremap <leader>q <cmd>x<cr>

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq

" Switch window
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h

" Split vertical
nnoremap <leader>v <C-w>v

" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

"coc-nvim"
" trigger with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" abort auto
function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" complete auto
inoremap <silent><expr> <C-space> coc#refresh()
" goto def
nmap <silent> gd <Plug>(coc-definition)
" goto type def
nmap <silent> gy <Plug>(coc-type-definition)
" goto implementation
nmap <silent> gi <Plug>(coc-implementation)
" goto refs
nmap <silent> gr <Plug>(coc-references)
" show doc
nnoremap <silent> K :call <SID>show_documentation()<CR>
" rename current work
nmap <leader>rn <Plug>(coc-rename)

" NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" map <leader>t :NERDTreeToggle<CR>
" let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowClean = 1

" CHADTree
" nnoremap <leader>t <cmd>CHADopen<cr>
" lua vim.api.nvim_set_var("chadtree_ignores", { name = {".*", ".git"} })
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | CHADopen
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == "chadtree") | q | endif

" CoC-explorer
nnoremap <leader>e <cmd>CocCommand explorer<cr>

" Fuzzy finder
nnoremap <leader>s <cmd>FZF<cr>

" clang-format
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" neoformat
nnoremap <leader>f <cmd>Neoformat<cr>

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" vimtex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'latexmk'
let g:vimtex_view_method = 'mupdf'
nnoremap <leader>p <cmd>VimtexCompile<cr>
