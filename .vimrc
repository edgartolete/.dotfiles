execute pathogen#infect()
syntax on
filetype plugin indent on
call plug#begin()

"Fuzzy Finder. used to search Folder, Files, and Text. make sure you fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree' " File tree explorer
Plug 'preservim/tagbar' " Code tree structure
Plug 'mbbill/undotree' " Undo changes tree
Plug 'girishji/autosuggest.vim' " Auto suggest while typing
Plug 'tpope/vim-commentary' " turn code into a comment
Plug 'tpope/vim-fugitive' "Git helper
Plug 'tpope/vim-surround' " add, change, delete surrounding character
Plug 'prabirshrestha/vim-lsp' " LSP Manager
Plug 'mattn/vim-lsp-settings' " easily install LSP by typing :LspInstallServer while a file is open
Plug 'sheerun/vim-polyglot' "Syntax highlighting and do proper indenting
Plug 'Yggdroot/indentLine' "Indentation
Plug 'vim-airline/vim-airline' " bottom status line
Plug 'MattesGroeger/vim-bookmarks' " bookmarkings
Plug 'junegunn/vim-easy-align' "shortcut keys to align items by character
Plug 'joshdick/onedark.vim' "THEME colorscheme
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Showing Diagnostics like errors and warnings inline
" Plug 'prabirshrestha/asyncomplete.vim' " auto complete
" Plug 'prabirshrestha/asyncomplete-lsp.vim' " auto complete from LSP
" Plug 'airblade/vim-tailwind' " Tailwind auto suggest
call plug#end()

" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"OPTIONS
let g:bookmark_no_default_key_mappings = 1 "disable default keymappings
set autoindent
set tabstop=2
set shiftwidth=2
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set number
set relativenumber
set signcolumn=yes
syntax on
colorscheme moonfly

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_auto_config = 1

"KEY BINDINGS
let mapleader = " "

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nnoremap <F5> :source $MYVIMRC<CR>

map <leader>te :NERDTreeToggle<CR>
map <leader>tu :UndotreeToggle<CR>
map <leader>ts :TagbarToggle<CR>

map <leader>ff :Files<CR>
map <leader>fb :Buffers<CR>
map <leader>fg :Ag<CR>
map <leader>fo :History<CR>
map <leader>fj :Jumps<CR>

" Configure key bindings for LSP features
nnoremap <silent>fd :LspDefinition<CR>
nnoremap <silent>fr :LspReferences<CR>
nnoremap <silent>fi :LspImplementation<CR>
nnoremap <silent>ft :LspTypeDefinition<CR>
" nnoremap <silent>K :LspHover<CR>

nmap <silent>mm <Plug>BookmarkToggle
nmap <silent>ml <Plug>BookmarkShowAll
nmap <silent>mn <Plug>BookmarkNext
nmap <silent>mp <Plug>BookmarkPrev
nmap <silent>ma <Plug>BookmarkPrev
nmap <silent>mc <Plug>BookmarkClear
nmap <silent>mx <Plug>BookmarkClearAll

nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <silent> <buffer> gk <Plug>(tailwind-lookup)
nnoremap <silent>gf :Git<CR>
