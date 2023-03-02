" General maps
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bp :bp<CR>
noremap <leader>bd :bd<space>
noremap <silent> <leader>ll :ls<CR>
tnoremap <Esc> <C-\><C-n>

" Termdebug
nnoremap gb :Termdebug<space>

" Tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" NerdTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

"Ale
nnoremap <silent> gd :ALEGoToDefinition -split<CR>
nnoremap <silent> gt :ALEGoToTypeDefinition -split<CR>
nnoremap <silent> <leader>rn :ALERename<CR>
nnoremap gs :ALESymbolSearch<space>
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <silent> gI :ALEImport<CR>
nnoremap <silent> <leader>fa :ALEFix<CR>
nnoremap <silent> <leader>fs :ALEFixSuggest<CR>

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
