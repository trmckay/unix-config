set encoding=UTF-8
set nu rnu
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

autocmd BufRead,BufNewFile * setlocal nospell
autocmd BufRead,BufNewFile *.* setlocal nospell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

let mapleader = "\<Space>"

call plug#begin()
Plug 'unblevable/quick-scope'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
" Plug 'norcalli/nvim-colorizer.lua'
Plug '/usr/bin/fzf'
Plug 'sainnhe/forest-night'
Plug 'xarthurx/taskwarrior.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

highlight clear SignColumn

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

au BufRead /tmp/mutt-* set tw=72

" color scheme
" set termguicolors
" let g:forest_night_enable_italic = 1
" let g:forest_night_disable_italic_comment = 1
" colorscheme forest-night
"
autocmd BufRead,BufNewFile *.cir setlocal filetype=cir

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16"

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

" colorizer
" lua require'colorizer'.setup()

" pandoc
noremap <buffer> <leader>pb :Pandoc! beamer<cr><cr>
noremap <buffer> <leader>pd :Pandoc!<cr><cr>
let g:pandoc#modules#disabled = ["folding"]

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

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F']

" CoC-explorer
nnoremap <leader>e <cmd>CocCommand explorer<cr>

" Fuzzy finder
nnoremap <leader>s <cmd>FZF<cr>

" neoformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
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
let g:vimtex_view_method = 'zathura'
nnoremap <leader>p <cmd>VimtexCompile<cr>
