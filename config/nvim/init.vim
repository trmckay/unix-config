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
set shortmess=a
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
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'sainnhe/forest-night'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xarthurx/taskwarrior.vim'
Plug 'tpope/vim-fugitive'
Plug 'wfxr/minimap.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'skywind3000/asyncrun.vim'
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

nnoremap <leader>po <cmd>!pandoc % -o `echo % \| sed 's/\.md/\.pdf/'`; zathura `echo % \| sed 's/\.md/\.pdf/'` &<cr>
autocmd bufwritepost *.md AsyncRun pandoc "%" -o `echo "%" | sed 's/\.md/\.pdf/'`
autocmd bufleave *.md <cmd>!rm preview.pdf<cr>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16_adwaita"

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

" markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F']

" coc-explorer
nnoremap <leader>e <cmd>CocCommand explorer<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | CocCommand explorer

" Fuzzy finder
nnoremap <leader>s <cmd>FZF<cr>

" neoformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" fzf
nnoremap <leader>f <cmd>BLines<cr>

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" vimtex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'latexmk'
let g:vimtex_view_method = 'zathura'
nnoremap <leader>p <cmd>VimtexCompile<cr>

" minimap
nnoremap <leader>m <cmd>MinimapToggle<cr>
