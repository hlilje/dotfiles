" Maintainer: Hampus Liljekvist
" Version:    2014-08-09

set nocompatible " Enable Vim mode

"""""" Unix Specific Settings
if has("unix")
  " This line should not be removed as it ensures that various options are
  " properly set to work with the Vim-related packages available in Debian
  runtime! debian.vim

  " Vundle settings
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()

  " Set font and font size
  "set guifont=Ubuntu\ Mono\ 11
  "set guifont=Source\ Code\ Pro\ 10

  if system('uname')=~'Darwin'
      set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    else " Different syntax for Ubuntu
      set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
  endif

  let g:airline_powerline_fonts = 1 " Enably fancy Powerline fonts

  " Force Vim to detect gnome-terminal's colour support
  if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  endif
endif

"""""" Windows Specific Settings
if has("win32")
  " Vundle settings
  set runtimepath+=~/vimfiles/bundle/vundle/
  call vundle#rc("~/vimfiles/bundle")

  " Function to install Vundle bundles at the right place on Windows
  func! vundle#rc(...) abort
    let g:bundle_dir = len(a:000) > 0 ? expand(a:1, 1) : expand('$HOME/vimfiles/bundle', 1)
    let g:vundle_log = []
    call vundle#config#init()
  endf

  " Set font and font size
  "set guifont=Consolas:h10
  set guifont=Source_Code_Pro:h9
endif

"""""" Vundle Bundles
" Bundle declarations have to happen when filetype off, and filetype plugin
" indent on have to come after them
""" GitHub
Bundle 'gmarik/vundle'
Bundle 'bkad/CamelCaseMotion'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'jnwhiteh/vim-golang'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
""Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomasr/molokai'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-vinegar'
Bundle 'Yggdroot/indentLine'
"""" vim.org
Bundle 'taglist.vim'

"""""" Language Options
""" Vim language
set langmenu=en_US.UTF-8 " Set the language of the menu (gvim)
let $LANG = 'en' " Set the language
""" Spell check
set spelllang=en spell
set nospell " Disable by default

"""""" Program Stuff
" Fix for go syntax highlighting
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on " Use specific settings based on the filetype
syntax on
set encoding=utf-8 " Set encoding
" Current buffer can be put in background without writing to disk
" and mark/undo history is remembered when it becomes current again
set hidden

"""""" Windows Behaviour
behave mswin " Windows-like mouse behaviour
source $VIMRUNTIME/mswin.vim " Gives Windows key mappings like Ctrl-Y

"""""" GUI Settings
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions+=LlRrb " Add scrollbars...
set guioptions-=LlRrb " Remove scrollbars

"""""" Visual Settings
colorscheme molokai " Set color scheme
syntax on " Enable syntax highlighting
set background=dark " Use the dark version of the color scheme
set number " Show line numbers
set ruler " Show the cursor position all the time
set showcmd " Display incomplete commands at bottom
set showmatch " Show matching parentheses
set title " Set the Vim title when running in an xterm
set cursorline " Highlight current line
"set colorcolumn=121 " Highlight the given column
""" Highlight lines longer than 120 columns in red
"autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"autocmd BufEnter * match OverLength /\%121v.\+/
""" Set transparent background for gnome-terminal
if $COLORTERM == 'gnome-terminal'
  highlight Normal ctermbg=NONE
endif

"""""" Line Breaks
set linebreak nolist textwidth=0 wrapmargin=0 " Disables auto line break
set nowrap " Disable line wrapping
"set tw=100 " When to break lines, this must be 0 to disable auto line break

"""""" Error Messages
set noerrorbells " Disable error bells
set visualbell " Disables the audio bell and toggles the visual bell
set t_vb= " Sort of disables the visual bell
autocmd GUIEnter * set visualbell t_vb= " Since t_vb must be set after the GUI is loaded

"""""" Scrolling
set scrolloff=8 " Start scrolling when 8 lines away from margins
set sidescrolloff=4 " Number of lines to keep when scrolling sideways

"""""" Filetype Specifics
""" Use specific settings for different languages
autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType css setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType php setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

"""""" Tabbing
set tabstop=4 " Set visual size of tabs
set softtabstop=4 " How many columns are used when hitting Tab in insert mode
set shiftwidth=4 " Set how many columns is indented by << and >>
set expandtab " Use spaces for tabs

"""""" Backup
set nobackup " Stop creation of backup files
set nowritebackup " Changes the save behaviour, prevents 'jumping files' in Windows
set noswapfile " Disables the swap file which stores unsaved changes

"""""" Indentation
set autoindent " Keep indentation
set copyindent " Copy the previous indentation on autoindenting
set smartindent " Automatic indentation for brackets

"""""" Searching
set incsearch " Do incremental searching
set hlsearch " Highlight search terms
" Together these make regular searches case-sensitive only when there is a
" capital letter in the search expression
set ignorecase
set smartcase

"""""" History
set history=1000 " Lines of command history to keep
set undolevels=1000 " Amount of undo's to remember

"""""" Code Completion
set wildmenu " Enable the wildmenu for tab completion
set wildmode=list:full " Wildmenu settings
set omnifunc=syntaxcomplete#Complete " Turn on omni completion

"""""" Backspacing
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"""""" Whitespace
" Set how these whitspace chars should be displayed
set listchars=tab:>-,trail:·,eol:$,extends:>,precedes:<,nbsp:_

"""""" Sessions
" Save state upon leaving and restore it upon entering
"autocmd VimLeave * execute ':mksession! ~/.vimsession'
"autocmd VimEnter * execute ':source ~/.vimsession'

"""""" Leader
" Set the leader key to somewhere reasonable
let mapleader = ","

"""""" Plugin Settings
""" AutoClose
let g:AutoCloseExpandSpace = 0 " Disable space to not break abbreviation expansion

""" CtrlP
let g:ctrlp_cmd = 'CtrlPBuffer' " Use buffer search as default

""" EasyMotion
let g:EasyMotion_smartcase = 1 " Match like smartcase for global search

""" indentLine
let g:indentLine_faster = 1 " Make it faster
autocmd GUIEnter * syntax on " For some reason this has to be redone

""" Molokai
let g:molokai_original = 0 " Set whether to use the lighter original background
let g:rehash256 = 1 " Make terminal Vim look similar to the dark gui theme

""" NERDTree(Tabs)
let g:nerdtree_tabs_open_on_gui_startup = 0 " Disable open on startup

""" sneak.vim
let g:sneak#streak = 1 " Use as a minimalist alternative to EasyMotion
let g:sneak#s_next = 1 " Use 's' to jump to next match
let g:sneak#use_ic_scs = 1 " ignorecase/smartcase decides case-sensitivity

""" Syntastic
"let g:syntastic_check_on_wq = 0 " Don't check on buffer wq

""" Rainbow Parentheses
" Toggle upon program start
"autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd Syntax * RainbowParenthesesLoadChevrons

""" Taglist
let Tlist_Use_Right_Window = 1 " Open to the right
"let Tlist_Auto_Open = 1 " Open on launch

""" vim-airline
set laststatus=2 " Make it appear without splitting
let g:airline#extensions#tabline#enabled = 1 " Enable buffer tabs

"""""" Macros
""" Enable macro to match html/xml/etc. tags with %
runtime macros/matchit.vim

"""""" Custom Functions
""" Remembering and restoring gVim's window size and position
" Settings
let g:screen_size_restore_pos = 1 " To enable the saving and restoring of screen positions
let g:screen_size_by_vim_instance = 1 " Restore each instance separately

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance == 1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance == 1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
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

"""""" Abbreviations
""" Java
ab syso System.out.println("");<Esc>2hi

"""""" Key Bindings
" Remap Esc to get out of insert mode quickly
imap jk <Esc>
imap kj <Esc>
" Since ` jumps to the right colum as well it should be easier to reach
nnoremap ' `
nnoremap ` '
" Remap Tab to cycle between listed buffers and show them afterwards
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Use more than 1 step when scrolling
nnoremap <C-e> 8<C-e>
nnoremap <C-y> 8<C-y>
" Toggle whitespace visibility with <Leader>s and mute messages with <silent>
nnoremap <silent> <Leader>sw :set nolist!<CR>
" Mapping to edit the vimrc quickly
nnoremap <Leader>ev :e $MYVIMRC<CR>
" Mapping to write and source the current file quickly
nnoremap <Leader>sv :w<CR> :so %<CR>
" Remap : to ; to avoid having to use Shift when entering commands
nnoremap ; :
" Easy window navigation by removing the -w step
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Quick way to toggle NERDTreeTabs in current dir
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
" Expand NERDTree to current dir
nnoremap <Leader>ct :NERDTreeFind<CR>
" Cycle tabs with Tab
nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>
" Write session with F2 and restore with F3
map <F2> :mksession! ~/.vimsession <CR>
map <F3> :source ~/.vimsession <CR>
" Bind omni-completion to Ctrl Space
inoremap <C-Space> <C-x><C-o>
""" Mappings for quickly selecting tabs
imap <A-1> <Esc>:tabn 1<CR>i
imap <A-2> <Esc>:tabn 2<CR>i
imap <A-3> <Esc>:tabn 3<CR>i
imap <A-4> <Esc>:tabn 4<CR>i
imap <A-5> <Esc>:tabn 5<CR>i
imap <A-6> <Esc>:tabn 6<CR>i
imap <A-7> <Esc>:tabn 7<CR>i
imap <A-8> <Esc>:tabn 8<CR>i
imap <A-9> <Esc>:tabn 9<CR>i
imap <A-0> <Esc>:tabn 0<CR>i
map <A-1> :tabn 1<CR>
map <A-2> :tabn 2<CR>
map <A-3> :tabn 3<CR>
map <A-4> :tabn 4<CR>
map <A-5> :tabn 5<CR>
map <A-6> :tabn 6<CR>
map <A-7> :tabn 7<CR>
map <A-8> :tabn 8<CR>
map <A-9> :tabn 9<CR>
map <A-0> :tabn 0<CR>
""" Mappings for quickly selecting buffers
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" Map control-backspace to delete the previous word
imap <C-BS> <C-w>
" Format everything quickly
nnoremap <Leader>fa ggVG=
" Change dir globally to active window
nnoremap <Leader>cd :cd%:p:h<CR>
" Hack to close buffer without closing window
nnoremap <Leader>dd :bp<Bar>sp<Bar>bn<Bar>bd<CR>
" Wish this worked...
"nnoremap :w]<CR> <NOP>
" Convert between line endings
nnoremap <Leader>ctu :set ff=unix<CR>
nnoremap <Leader>ctw :set ff=dos<CR>
" Delete trailing whitespace
nnoremap <Leader>dw :%s/\s\+$//<CR>
" Toggle Rainbow Parentheses
nnoremap <Leader>rp :RainbowParenthesesToggle<CR>
" Toggle Taglist
nnoremap <Leader>tl :TlistToggle<CR>
" Scroll x chars to the left/right
nnoremap zl 80zl
nnoremap zh 80zh
""" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
""" Do more useful things with standard keys in normal mode
nnoremap <CR> viw
nnoremap <BS> vap
" Toggle fold with space, works as normal if no fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Toggle line wrap
map <F9> :set wrap!<CR>
""" Keep visually selected text when indenting
"vmap > >gv
"vmap < <gv
" Remap Ex mode key to just playback from q register instead
nnoremap Q @q
" Make Y behave as C and D instead of yanking the entire line
nnoremap Y y$
