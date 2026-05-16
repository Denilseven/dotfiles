" Some funni:
" set termguicolors
" highlight Normal guibg=NONE ctermbg=NONE

" Tip: use :map <C-x> to check for bindings
" Tip: type :options or :help 'option' for details
" Tip: use the expandtab option to use spaces instead
" Tip: :help key-notation

" https://www.youtube.com/watch?v=XA2WjJbmmoM
" :help netrw-browse-maps

inoremap ç <Esc>
vnoremap ç <Esc>
cnoremap ç <C-C>

syntax enable
hi MatchParen cterm=bold ctermbg=none ctermfg=green
colorscheme habamax
set nocompatible
filetype plugin on

set list
set listchars=tab:→\ ,trail:·,lead:·

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=3

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

set wildmenu
set wildoptions+=pum

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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

set mouse=a

function! ToggleColorColumn()
    if &colorcolumn == ""
        set colorcolumn=120
    else
        set colorcolumn=
    endif
endfunction
nnoremap <Leader>cc :call ToggleColorColumn()<CR>

" Tabs control
nnoremap <Esc>h :tabprevious<CR>
nnoremap <Esc>l :tabnext<CR>
nnoremap <Esc>j :tabmove -1<CR>
nnoremap <Esc>k :tabmove +1<CR>
nnoremap <Esc>w :tabclose<CR>

" Tabline
set showtabline=2 " Always show the tabline
set tabline=%!TabLineExtra()
function! TabLineExtra()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)

        if !empty(buflist)
            let buf = buflist[winnr - 1]
            let name = bufname(buf) ==# '' ? '[No Name]' : fnamemodify(bufname(buf), ':t')
            let mod = getbufvar(buf, '&modified') ? '*' : ' '
        else
            let name = '[No Name]'
            let mod = ' '
        endif

        if i == tabpagenr()
            let name = '%#TabLineFill#◢' . '%#TabLineSel#' . ' ' . name . mod
            let name .= '%#TabLineFill#◣'
        else
            let s .= '%#TabLine#'
            let name = '  ' . name . mod . ' '
        endif

        let s .= name
    endfor
    let s .= '%#TabLine#%='
    return s
endfunction

" Ctrl+s save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Reload config
nnoremap <Esc>o :source ~/.vimrc<CR><Cmd>echo "sourced ~/.vimrc!"<CR>

