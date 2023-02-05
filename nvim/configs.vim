" General
set list listchars=tab:\›\ ,trail:-,extends:>,precedes:<,eol:¬,space:·
let mapleader = " "
syntax enable
set clipboard+=unnamedplus
set spell spelllang=en_us
set dictionary+=/usr/share/dict/words
set background=dark
set number relativenumber
colorscheme nord
autocmd BufWritePre * %s/\s\+$//e

" Termdebug
packadd termdebug
exec 'source ' . stdpath('config') . '/termdebug_functions.vim'
command -nargs=+ Info :call GDBCommand('info', <f-args>)
command -nargs=+ Thread :call GDBCommand('thread', <f-args>)
command -nargs=+ BreakCustom :call GDBCommand('break', <f-args>)
command -nargs=* Backtrace :call GDBCommand('backtrace', <f-args>)
command -nargs=* Up :call GDBCommand('up', <f-args>)
command -nargs=* Down :call GDBCommand('down', <f-args>)
command -nargs=* Frame :call GDBCommand('frame', <f-args>)
command -nargs=+ Set :call GDBCommand('set', <f-args>)
command -nargs=+ SetVar :call GDBCommand('set var', <f-args>)
command -nargs=+ Watch :call GDBCommand('watch', <f-args>)
command -nargs=+ Memory :call GDBCommand(<f-args>)

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
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "nord"

" Deoplate
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale', 'ultisnips'],
\})

" Ale
let g:ale_c_clangformat_use_local_file = 1
let g:ale_linters = {"python": ["flake8", "pydocstyle", "bandit", "pylsp"]}
let g:ale_fixers = {"python": ["nayvy#ale_fixer", "autoimport", "black", "isort"],
		  \ "c": ["clang-format"],
		  \ "cpp": ["clang-format"]}
let g:nayvy_pyproject_root_markers = [
  \ 'manage.py',
  \ 'pyproject.toml',
  \ 'setup.py',
  \ 'setup.cfg',
  \ 'requirements.txt',
\ ]
