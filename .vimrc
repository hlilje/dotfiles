set nocompatible

" Init Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

""" Unix specific settings
if has('unix')
  " Linux (Ubuntu) specific
  if system('uname')=~'Linux'
    " This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian
    runtime! debian.vim

    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
  endif

  let g:airline_powerline_fonts = 1
endif

""" Windows specific settings
if has('win32')
  set guifont=Source_Code_Pro:h9
endif

"" Vundle bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'bkad/CamelCaseMotion'
Plugin 'bling/vim-airline'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'matze/vim-move'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/a.vim'
Plugin 'Yggdroot/indentLine'

" Required after loading plugins
call vundle#end()
filetype plugin indent on

""" Settings
autocmd FileType css setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType php setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sass setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scss setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd GUIEnter * set visualbell t_vb= " BUGFIX: t_vb must be set after the GUI is loaded
source $VIMRUNTIME/mswin.vim
behave mswin
colorscheme molokai
" highlight Normal ctermbg=NONE
syntax on
let mapleader = ','
let $LANG = 'en_GB'
set encoding=utf-8
set langmenu=en_GB.UTF-8
set autoindent copyindent smartindent
set background=dark
set backspace=indent,eol,start
set clipboard^=unnamed
set cursorline
set number
set ruler
set expandtab softtabstop=4 tabstop=4
set guioptions+=LlRrb " BUGFIX: Must add scrollbars before removing them
set guioptions-=LlRrb guioptions-=T guioptions-=m
set hidden
set history=1000 undolevels=1000
set hlsearch incsearch ignorecase smartcase
set showmatch
set listchars=tab:>-,trail:·,eol:$,extends:>,precedes:<,nbsp:_
set nobackup nowritebackup noswapfile
set noerrorbells visualbell t_vb= " Set the visual bell to do nothing
set nospell spelllang=en_gb
set scrolloff=8 sidescrolloff=4
set textwidth=0 shiftwidth=4
set showcmd
set title
set nowrap wrapmargin=0
set linebreak
set omnifunc=syntaxcomplete#Complete
set wildmenu wildmode=list:full

""" Plugin settings
" AutoClose
let g:AutoCloseExpandSpace = 0
" CtrlP
let g:ctrlp_cmd = 'CtrlPBuffer'
" EasyMotion
let g:EasyMotion_smartcase = 1
" Git Gutter
" BUGFIX: Copied from source to force a reload of colours
autocmd VimEnter * call gitgutter#highlight#define_sign_column_highlight() | call gitgutter#highlight#define_highlights()
" indentLine
let g:indentLine_faster = 1
autocmd GUIEnter * syntax on " BUGFIX: For some reason this has to be redone
" Molokai
" let g:molokai_original = 1
let g:rehash256 = 1
" NERDTree(Tabs)
let g:nerdtree_tabs_open_on_gui_startup = 0
" sneak.vim
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
" Syntastic
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_python_python_exec = 'python3'
" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" vim-go
let g:go_fmt_autosave = 0

""" Macros
runtime macros/matchit.vim

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
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=80
  endif
endfunction

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
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> w <Plug>CamelCaseMotion_w
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
sunmap b
sunmap e
sunmap w
vnoremap <Space> zf

""" Leader bindings
nnoremap <Leader>cd :cd%:p:h<CR>
nnoremap <Leader>ct :NERDTreeFind<CR>
nnoremap <Leader>dd :bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>dw :%s/\s\+$//<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>fa ggVG=
nnoremap <Leader>nn :nohlsearch<CR>
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
nnoremap <Leader>sv :w<CR> :source $MYVIMRC<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>cc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <Leader>sw :set nolist!<CR>
