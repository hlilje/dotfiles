""" Vim files
runtime! defaults.vim
runtime! macros/matchit.vim

""" Specify vim-plug directory
call plug#begin('~/.vim/plugged')

""" vim-plug plugins
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'matze/vim-move'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/a.vim'

Plug 'tomasr/molokai'

""" Initialize vim-plug plugin system
call plug#end()

""" OS specific settings
if has('macunix')
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
elseif has('unix')
    " Ensures that various options are properly set to work with the
    " Vim-related packages available in Debian
    runtime! debian.vim

    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
elseif has('win32')
    set guifont=Source_Code_Pro_for_Powerline:h9
endif

""" Settings
behave mswin

autocmd FileType css setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sass setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scss setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

colorscheme molokai

let mapleader = ','
let $LANG = 'en_GB'

set encoding=utf-8
set langmenu=en_GB.UTF-8
set autoindent copyindent smartindent
set autoread
set background=dark
set clipboard=unnamed
set cursorline
set number
set expandtab softtabstop=4 tabstop=4
set guioptions+=LlRrb " Must add scrollbars before removing them
set guioptions-=LlRrb guioptions-=T guioptions-=m
set termguicolors
set hidden
set history=1000 undolevels=1000
set hlsearch ignorecase smartcase
set showmatch
set listchars=tab:>-,trail:·,eol:$,extends:>,precedes:<,nbsp:_
set nobackup nowritebackup noswapfile
set nospell spelllang=en_gb
set scrolloff=8 sidescrolloff=4
set textwidth=0 shiftwidth=4
set title
set nowrap wrapmargin=0
set linebreak
set omnifunc=syntaxcomplete#Complete
set wildmode=list:full
set belloff=all

""" Plugin settings
" indentLine
let g:indentLine_faster = 1
" Molokai
let g:rehash256 = 1
" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""" Custom functions
" Remembering and restoring gVim's window size and position
let g:screen_size_restore_pos = 1
let g:screen_size_by_vim_instance = 1

if has('gui_running')
    function! ScreenFilename()
        if has('win32')
            return $HOME.'\_vimsize'
        else
            return $HOME.'/.vimsize'
        endif
    endfunction

    function! ScreenRestore()
        let f = ScreenFilename()
        if has('gui_running') && g:screen_size_restore_pos && filereadable(f)
            let vim_instance = g:screen_size_by_vim_instance == 1 ? v:servername : 'GVIM'
            for line in readfile(f)
                let sizepos = split(line)
                if len(sizepos) == 5 && sizepos[0] == vim_instance
                    silent! execute 'set columns='.sizepos[1].' lines='.sizepos[2]
                    silent! execute 'winpos '.sizepos[3]." ".sizepos[4]
                    return
                endif
            endfor
        endif
    endfunction

    function! ScreenSave()
        if has('gui_running') && g:screen_size_restore_pos
            let vim_instance = g:screen_size_by_vim_instance == 1 ? v:servername : 'GVIM'
            let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                        \ (getwinposx() < 0 ? 0 :getwinposx()) . ' ' .
                        \ (getwinposy() < 0 ? 0 :getwinposy())
            let f = ScreenFilename()
            if filereadable(f)
                let lines = readfile(f)
                call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
                call add(lines, data)
            else
                let lines = [data]
            endif
            call writefile(lines, f)
        endif
    endfunction

    if !exists('g:screen_size_restore_pos')
        let g:screen_size_restore_pos = 1
    endif
    if !exists('g:screen_size_by_vim_instance')
        let g:screen_size_by_vim_instance = 1
    endif
    autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | wincmd = | endif
    autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=80
    endif
endfunction

""" Commands
command Rediff diffoff | diffthis

""" Abbreviations
ab sout std::cout << << std::endl;<Esc>13hi
ab syso System.out.println();<Esc>hi

""" Key bindings
imap jk <Esc>
imap kj <Esc>
inoremap <C-Space> <C-x><C-o>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <F2> :mksession! ~/.vimsession <CR>
map <F3> :source ~/.vimsession <CR>
map <F9> :set wrap!<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-Tab> :tabn<CR>
nmap <C-t> :tabnew<CR>
nnoremap ; :
nnoremap <C-e> 8<C-e>
nnoremap <C-y> 8<C-y>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
nnoremap Q @q
nnoremap Y y$
nnoremap zh 80zh
nnoremap zl 80zl
vnoremap <Space> zf

""" Leader bindings
nnoremap <Leader>cd :cd%:p:h<CR>
nnoremap <Leader>ct :NERDTreeFind<CR>
nnoremap <Leader>dd :bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>dw :%s/\s\+$//<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>fa ggVG=
nnoremap <Leader>nn :nohlsearch<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>sv :w<CR> :source $MYVIMRC<CR>
nnoremap <silent> <Leader>cc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <Leader>sw :set nolist!<CR>
