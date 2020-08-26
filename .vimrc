" VUNDLE STUFF
" from https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'henrik/vim-qargs'
Plugin 'aquach/vim-http-client'

"NVIM PYTHON SUPPORT
"NOTE: this is only for the 'fit' virutalenv.
" see https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim for ref.
let g:python3_host_prog = '/Users/josh/.virtualenvs/fit/bin/python3'

" JULIA
Plugin 'JuliaEditorSupport/julia-vim'
runtime macros/matchit.vim


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Ctrl-j move to the split below
"Ctrl-k move to the split above
"Ctrl-l move to the split to the right
"Ctrl-h move to the split to the left

set history=800     "How many lines to remember
set autoread        "Reload the file if changed from the outside
set hlsearch        "Highlight search
set incsearch       "Incremental search

" ===== LINTING =====
Plugin 'w0rp/ale'
" Ale linter settings
let g:ale_linters = {'javascript': ['eslint'], 'python': ['pylint'], 'json': ['jsonlint']}
let g:ale_fixers = {'json': ['fixjson'], 'javascript': ['eslint', 'prettier'], 'python': ['black', 'trim_whitespace', 'remove_trailing_lines', 'isort']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '-l 100'
let g:ale_python_pylint_change_directory = 0
map <F1> :ALEFix<CR>

" ===== INDENTATION =====
Plugin 'vim-scripts/indentpython.vim'

set cursorline      "Underlines current line
set mouse=a         "Enables mouse
set encoding=utf-8

" ======= CODE FOLDING ======
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'

" ====== SYNTAX HIGHLIGHTING =====
"Plugin 'nvie/vim-flake8'
"let python_highlight_all=1
"syntax on

" ====== COLOR SCHEME =====
syntax enable
set background=light
" for neovim:
colorscheme NeoSolarized
" for vim:
"colorscheme solarized

"====== COPY PASTE =====
set clipboard=unnamed

"====== MAXIMUM COLUMN NUMBER ========
set colorcolumn=100
set textwidth=100

"======== CENTER TEXT ============
Plugin 'junegunn/goyo.vim'
let g:goyo_width=100

" ===== FILE BROWSING =====
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" FUZZY FIND
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'r' " Use nearest .git directory as cwd
set wildignore+=.git,*/node_modules/*,*/deps/build/*,*/stack/*,*/deps/go/*,*/deps/node/*,*/_site/*,*/__pycache__/*


" ====== NVIM =========
tnoremap <Esc> <C-\><C-n>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Fuzzy Find (fzf) 
set rtp+=/usr/local/opt/fzf
