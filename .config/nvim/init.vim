" make sure dotfiles are installed so this link works ln -s ~/.dotfile/zsh/.zshrc ~/.zshrc

" Setup Plugin Manageur -------------------- {{{
call plug#begin('~/vim/plugged')

" Themeing
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

" Syntax Tree Building
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Auto Completetion and Method Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File Explorer for Vim
Plug 'kyazdani42/nvim-web-devicons'

" File icons 
Plug 'kyazdani42/nvim-tree.lua'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" Rust Programming
Plug 'rust-lang/rust.vim'

" Make programming transparent
Plug 'xiyaowong/nvim-transparent'
let g:transparent_enabled=v:true

" Fuzzy Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

call plug#end()
" }}}

" Lua Infrastructure Setup {{{
lua require('nvim-tree').setup {}
lua require('lualine').setup { options = { theme = 'embark' } }
" }}}

" Setup Mappings --------------------------- {{{
let mapleader = " " 

" Window Bouncing
map <leader>h <C-w>h 
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l 

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Bunch of code actions I may want to use
map <silent> gb <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cl <Plug>(coc-codelens-action)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting Selected Code (TODO: Comeback and See if I Want this)
xmap <leader>ff <Plug>(coc-format-selected)
nmap <leader>ff <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" File Searching Mappings
nnoremap <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap<leader>m :Marks<CR>

" File Explorer Mappings
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Resizing Windows with pure Speed
nnoremap <silent> <leader>= :exe ":vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <leader>- :exe ":vertical resize " . (winwidth(0) * 3/4)<CR>

nnoremap <silent> <leader>mt :TransparentToggle<CR>

"TODO: Let's add a status bar here, cause that would be pretty cool

" }}}


" Setup Vimrc Defaults --------------------- {{{
syntax on
set termguicolors
colorscheme embark
let g:embark_terminal_italics=1
" in order to get the theme and fonts to play nice make sure to download and add a nerd-font
" https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono

:highlight Cursor guifg=white guibg=lightgrey
:highlight iCursor guifg=white guibg=coral

set guicursor=n-v-c-ci:block-Cursor
set guicursor+=i:block-iCursor

set encoding=utf-8
set autoindent
set backspace=indent,eol,start
set smarttab
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

set textwidth=0
set tabstop=4
set shiftwidth=4
set expandtab
"}}}

