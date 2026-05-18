" Tip: use :map <C-x> to check for bindings
" Tip: type :options or :help 'option' for details
" Tip: use the expandtab option to use spaces instead
" Tip: :help key-notation
" Tip: cat -v
" Tip: set makeprg?

" https://www.youtube.com/watch?v=XA2WjJbmmoM
" :help netrw-browse-maps

inoremap ç <Esc>
vnoremap ç <Esc>
cnoremap ç <C-C>

colorscheme habamax
syntax enable
set nocompatible
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi Comment cterm=italic
hi MatchParen ctermfg=Green guifg=Green
hi LineNr ctermfg=White guifg=White
" filetype plugin on

" For git-gutter plugin
set updatetime=300
set signcolumn=number

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
set showcmd

function! ToggleColorColumn()
    if &colorcolumn == ""
        set colorcolumn=120
    else
        set colorcolumn=
    endif
endfunction
nnoremap ,line :call ToggleColorColumn()<CR>

" Tabs control
nnoremap <Esc>h :tabprevious<CR>
nnoremap <Esc>l :tabnext<CR>
nnoremap <Esc>j :tabmove -1<CR>
nnoremap <Esc>k :tabmove +1<CR>
inoremap <Esc>h <Esc>:tabprevious<CR>
inoremap <Esc>l <Esc>:tabnext<CR>
inoremap <Esc>j <Esc>:tabmove -1<CR>
inoremap <Esc>k <Esc>:tabmove +1<CR>

" Go to tab
nnoremap <Esc>1 :tabnext 1<CR>
nnoremap <Esc>2 :tabnext 2<CR>
nnoremap <Esc>3 :tabnext 3<CR>
nnoremap <Esc>4 :tabnext 4<CR>
nnoremap <Esc>5 :tabnext 5<CR>
nnoremap <Esc>6 :tabnext 6<CR>
nnoremap <Esc>7 :tabnext 7<CR>
nnoremap <Esc>8 :tabnext 8<CR>
nnoremap <Esc>9 :tabnext 9<CR>
nnoremap <Esc>0 :tabnext $<CR> " Jump to the last tab

" New file
nnoremap <C-n> :tabnew<CR>

" Tabline
set showtabline=2 " Always show the tabline
set tabline=%!TabLineExtra()
function! TabLineExtra()
    let s = '  '
    for i in range(1, tabpagenr('$'))
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let mod = ' '

        if !empty(buflist)
            let buf = buflist[winnr - 1]
            let name = bufname(buf) ==# '' ? '[No Name]' : fnamemodify(bufname(buf), ':t')
            let mod = getbufvar(buf, '&modified') ? '*' : mod
        else
            let name = '[No Name]'
        endif

        if i == tabpagenr()
            let name = '%#TabLine#▚%#TabLineSel#' . mod .  name . ' '
            let name .= '%#TabLine#▚'
        else
            let s .= '%#TabLine#'
            let name = ' ' .  mod . name . '  '
        endif

        let s .= name
    endfor
    let s .= '%#TabLine#%='
    return s
endfunction

" Rename "NetrwTreeListing" tab
autocmd FileType netrw file [Netrw]

" Ctrl+s save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Alt+w to close
nnoremap <Esc>w :q<CR>

" Open explorer
nnoremap <Esc>e :Explore<CR>
nnoremap <Esc>E :!tree -C <Bar> less -R<CR>

" Switch from header to definition file and back
nnoremap <Esc>x :call SwapHeaderSource()<CR>
function! SwapHeaderSource()
    let l:ext = expand('%:e')
    if l:ext ==# 'cxx'
        execute 'find ' . fnameescape(expand('%:t:r')) . '.hxx'
    elseif l:ext ==# 'hxx'
        execute 'find ' . fnameescape(expand('%:t:r')) . '.cxx'
    else
        echo "Can't find for extension `." . l:ext . "`"
    endif
endfunction

" Build commands
set makeprg=make
nnoremap <F2> :make clean build<CR>
nnoremap <F3> :make run<CR>
nnoremap <F5> :make clean run<CR>

" Clipboard
" *Pasting already works out of the box
vnoremap <Leader>x d:call system('xclip -selection clipboard -i', @")<CR>
vnoremap <Leader>c y:call system('xclip -selection clipboard -i', @")<CR>
nnoremap <Leader>x dd:call system('xclip -selection clipboard -i', @")<CR>
nnoremap <Leader>c yy:call system('xclip -selection clipboard -i', @")<CR>

" Open up this file
nnoremap ,config :tabnew<CR>:edit ~/.vimrc<CR>

" Sort lines
vnoremap <Esc>a :sort<CR>

" Reload config
nnoremap <Esc>o :source ~/.vimrc<CR><Cmd>echo "sourced ~/.vimrc!"<CR>

" Snippets
nnoremap ,cout i/* DEBUG */ std::cout <<  << std::endl;<Esc>4bhi
nnoremap ,debug 0i/* DEBUG */ <Esc>
nnoremap ,ddebug 0df/x<Esc>

