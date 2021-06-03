call plug#begin('~/.vim/plugged')
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'

" python autoimport
Plug 'relastle/vim-nayvy'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

Plug 'cdelledonne/vim-cmake'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" General
syntax enable
set spell spelllang=en_us
set dictionary+=/usr/share/dict/words
set background=dark
set number relativenumber
colorscheme palenight
autocmd BufWritePre * %s/\s\+$//e
let g:lightline = { 'colorscheme': 'palenight' }

" Cmake
let g:cmake_build_dir_location = "build"

" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_async = 1
set updatetime=100
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight GitGutterAddLineNr    guifg=#009900 ctermfg=2
highlight GitGutterChangeLineNr guifg=#bbbb00 ctermfg=3
highlight GitGutterDeleteLineNr guifg=#ff2222 ctermfg=1
highlight GitGutterChangeDeleteLineNr guibg=#ff2222 ctermbg=1
highlight link GitGutterChangeLine DiffText
highlight link GitGutterChangeLineNr Underlined

" Neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_size = 10

" Tagbar
let g:tagbar_position = "left"
let g:tagbar_width = 30
autocmd VimEnter * nested :TagbarOpen

" NerdTree
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinPos = "right"
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "palenight"

" Ale
nnoremap <silent> <C-k><C-D> :ALEGoToDefinition<CR>
nnoremap <silent> <C-k><C-R> :ALERename<CR>
nnoremap <silent> <C-k><C-S> :ALESymbolSearch
nnoremap <silent> <C-k><C-H> :ALEHover<CR>
nnoremap <silent> <C-k><C-F> :ALEFindReferences<CR>
nnoremap <silent> <C-k><C-I> :ALEImport<CR>
let g:ale_lint_delay = 100
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = []
let g:ale_linters = {"python": ["flake8", "pydocstyle", "bandit", "pyls"]}
let g:ale_fixers = {"python": ["nayvy#ale_fixer", "autoimport", "black", "isort"]}
let g:nayvy_pyproject_root_markers = [
  \ 'pyproject.toml',
  \ 'setup.py',
  \ 'setup.cfg',
  \ 'requirements.txt',
\ ]

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-right>"
let g:UltiSnipsJumpBackwardTrigger="<c-left>"
