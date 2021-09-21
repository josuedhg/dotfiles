call plug#begin('~/.vim/plugged')
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" python autoimport
Plug 'relastle/vim-nayvy'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

Plug 'cdelledonne/vim-cmake'
Plug 'arcticicestudio/nord-vim'
call plug#end()
