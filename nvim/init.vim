" begin-options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=120 " Show at 120 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell" enable spell check (may need to download package)
set ttyfast " Speed up scrolling in Vim 
" end-options

" Install plugins under the specified directory
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim.plugged')

" start-plugin

" themes
Plug 'drewtempelmeyer/palenight.vim' " colorscheme palenight
" Plug 'https://github.com/davidcelis/vim-ariake-dark.git' " colorscheme Ariake-Dark
" Plug 'dracula/vim' " colorscheme darcula


" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" devicons
Plug 'ryanoasis/vim-devicons'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" polyglot
Plug 'sheerun/vim-polyglot'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" omnisharp
Plug 'Omnisharp/omnisharp-vim'

" fugitive
Plug 'tpope/vim-fugitive'

" powerline
Plug 'powerline/powerline-fonts'

" end-plugins

call plug#end()

" start-plugin-features

" start-configure-colorscheme
colorscheme palenight
set encoding=UTF-8
set background=dark
let g:bargreybars_auto=0
" end-configure-colorsheme

if (has("termguicolors"))
	set termguicolors
endif

" start-palenight-configuration
let g:palenight_terminal_italics=1
" end-palenight-configuation

" start-configure-airline
let g:airline_solorized_bg='dark'
let g:airling_theme='palenight'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
" end-configure-airline


" start-configure-nerdtree
let NERDTreeQuitOnOpen=1
" end-configure-nerdtree

" start-configure-coc
let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-tsserver', 'coc-tslint', 'coc-css',	'coc-html',	'coc-json',	'coc-wxml' ]
" end-configure-coc

" end-plugin-features

" start-feature-mappings

" code-navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" symbol rename
nmap <leader> rn <Plug>(coc-rename)

" format selected code
xmap <leader> f  <Plug>(coc-format-selected)
nmap <leader> f  <Plug>(coc-format-selected)

nnoremap <C-t> :NERDTreeToggle<CR>
" end-feature-mappings
