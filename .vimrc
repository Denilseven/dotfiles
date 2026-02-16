" Tip: use :map <C-x> to check for bindings
" Tip: type :options or :help 'option' for details
" Tip: use the expandtab option to use spaces instead

syntax on
colorscheme zaibatsu
hi MatchParen cterm=bold ctermbg=none ctermfg=green

set list
set listchars=tab:-\ ,trail:·,lead:·

set tabstop=6
set shiftwidth=6
set softtabstop=6
set autoindent
set smartindent

set relativenumber
set number
set numberwidth=1

set scrolloff=10
set nowrap

set hlsearch
set incsearch

set ignorecase
set smartcase

set wildmenu
set mouse=a

function! ToggleColorColumn()
	if &colorcolumn == ""
		set colorcolumn=120
	else
		set colorcolumn=
	endif
endfunction
nnoremap <Leader>cc :call ToggleColorColumn()<CR>

nnoremap <Leader>h :tabprevious<CR>
nnoremap <Leader>l :tabnext<CR>
nnoremap <Leader>j :tabm -1<CR>
nnoremap <Leader>k :tabm +1<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

