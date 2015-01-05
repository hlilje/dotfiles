set nocompatible " Enable Vim mode

"======== Unix Specific Settings
if has("unix")
  " Vundle settings
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()

  """ Linux (Ubuntu) Specific
  if system('uname')=~'Linux'
    " This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian
    runtime! debian.vim

    " Force Vim to detect gnome-terminal's colour support
    if $COLORTERM == 'gnome-terminal'
      set t_Co=256
    endif

    " Set font and font size (different syntax for Ubuntu)
    "set guifont=Ubuntu\ Mono\ 11
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
  endif

  let g:airline_powerline_fonts = 1 " Enably fancy Powerline fonts
endif

"======== Windows Specific Settings
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

"======== Vundle Bundles
" Bundle declarations have to happen when filetype off, and filetype plugin
" indent on have to come after them
""" GitHub
Plugin 'gmarik/vundle'

" TODO Does not colour line markers unless vimrc is reloaded
Plugin 'airblade/vim-gitgutter'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'bkad/CamelCaseMotion'
Plugin 'bling/vim-airline'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
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

"======== Language Options
""" Vim language
set langmenu=en_US.UTF-8 " Set the language of the menu (gvim)
let $LANG = 'en' " Set the language
""" Spell check
set spelllang=en spell
set nospell " Disable by default

"======== Program Related
" Fix for Go syntax highlighting
filetype off
filetype plugin indent on " Use specific settings based on the filetype
syntax on
set encoding=utf-8 " Set encoding
" Current buffer can be put in background without writing to disk
" and mark/undo history is remembered when it becomes current again
set hidden

"======== Windows Behaviour
behave mswin " Windows-like mouse behaviour
source $VIMRUNTIME/mswin.vim " Gives Windows key mappings like Ctrl-Y

"======== GUI Settings
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions+=LlRrb " Bugfix: Must add scrollbars first
set guioptions-=LlRrb " Remove scrollbars

"======== Visual Settings
colorscheme molokai " Set color scheme
syntax on " Enable syntax highlighting
set background=dark " Use the dark version of the color scheme
set number " Show line numbers
set ruler " Show the cursor position all the time
set showcmd " Display incomplete commands at bottom
set showmatch " Show matching parentheses
set title " Set the Vim title when running in an xterm
set cursorline " Highlight current line
"highlight Normal ctermbg=NONE " Use transparent text background in terminal

"======== Line Breaks
set linebreak nolist textwidth=0 wrapmargin=0 " Disables auto line break
set nowrap " Disable line wrapping
"set tw=100 " When to break lines, this must be 0 to disable auto line break

"======== Error Messages
set noerrorbells " Disable error bells
set visualbell " Disables the audio bell and toggles the visual bell
set t_vb= " Sort of disables the visual bell
autocmd GUIEnter * set visualbell t_vb= " Since t_vb must be set after the GUI is loaded

"======== Scrolling
set scrolloff=8 " Start scrolling when 8 lines away from margins
set sidescrolloff=4 " Number of lines to keep when scrolling sideways

"======== Filetype Specifics
""" Use specific settings for different languages
autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType css setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType php setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

"======== Tabbing
set tabstop=4 " Set visual size of tabs
set softtabstop=4 " How many columns are used when hitting Tab in insert mode
set shiftwidth=4 " Set how many columns is indented by << and >>
set expandtab " Use spaces for tabs

"======== Backup
set nobackup " Stop creation of backup files
set nowritebackup " Changes the save behaviour, prevents 'jumping files' in Windows
set noswapfile " Disables the swap file which stores unsaved changes

"======== Indentation
set autoindent " Keep indentation
set copyindent " Copy the previous indentation on autoindenting
set smartindent " Automatic indentation for brackets

"======== Searching
set incsearch " Do incremental searching
set hlsearch " Highlight search terms
" Together these make regular searches case-sensitive only when there is a
" capital letter in the search expression
set ignorecase
set smartcase

"======== History
set history=1000 " Lines of command history to keep
set undolevels=1000 " Amount of undo's to remember

"======== Code Completion
set wildmenu " Enable the wildmenu for tab completion
set wildmode=list:full " Wildmenu settings
set omnifunc=syntaxcomplete#Complete " Turn on omni completion

"======== Backspacing
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"======== Whitespace
" Set how these whitspace chars should be displayed
set listchars=tab:>-,trail:·,eol:$,extends:>,precedes:<,nbsp:_

"======== Leader
" Set the leader key to somewhere reasonable
let mapleader = ","

"======== Plugin Settings
""" AutoClose
let g:AutoCloseExpandSpace = 0 " Disable space to not break abbreviation expansion

""" EasyMotion
let g:EasyMotion_smartcase = 1 " Match like smartcase for global search

""" indentLine
let g:indentLine_faster = 1 " Make it faster
autocmd GUIEnter * syntax on " For some reason this has to be redone

""" Molokai
"let g:molokai_original = 1 " Use the original lighter background
let g:rehash256 = 1 " Make terminal Vim look similar to the dark gui theme

""" NERDTree(Tabs)
let g:nerdtree_tabs_open_on_gui_startup = 0 " Disable open on startup

""" Rainbow Parentheses
" TODO Does not toggle when autoloading on startup
"au VimEnter * RainbowParenthesesToggle " Auto load
au Syntax * RainbowParenthesesLoadRound " ()
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {}
au Syntax * RainbowParenthesesLoadChevrons " <>

""" sneak.vim
let g:sneak#s_next = 1 " Use 's' to jump to next match
let g:sneak#use_ic_scs = 1 " ignorecase/smartcase decides case-sensitivity

""" Syntastic
let g:syntastic_cpp_compiler_options = '-std=c++11' " Check with C++11
let g:syntastic_python_python_exec = 'python3' " Check with Python 3

""" vim-airline
set laststatus=2 " Make it appear without splitting
let g:airline#extensions#tabline#enabled = 1 " Enable buffer tabs

""" vim-go
let g:go_fmt_autosave = 0 " Disable auto fmt on save

"======== Macros
""" Enable macro to match html/xml/etc. tags with %
runtime macros/matchit.vim

"======== Custom Functions
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

"======== Abbreviations
""" C++
ab sout std::cout << << std::endl;<Esc>13hi

""" Java
ab syso System.out.println("");<Esc>2hi

"======== Key Bindings
" Remap Esc to get out of insert mode quickly
imap jk <Esc>
imap kj <Esc>
" Remap : to ; to avoid having to use Shift when entering commands
nnoremap ; :
""" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" Remap Ex mode key to just playback from q register instead
nnoremap Q @q
" Make Y behave as C and D instead of yanking the entire line
nnoremap Y y$
" Use more than 1 step when scrolling
nnoremap <C-e> 8<C-e>
nnoremap <C-y> 8<C-y>
" Easy window navigation by removing the -w step
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Remap Tab to cycle between listed buffers and show them afterwards
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Cycle tabs with Ctrl Tab
nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>
" Write session with F2 and restore with F3
map <F2> :mksession! ~/.vimsession <CR>
map <F3> :source ~/.vimsession <CR>
" Scroll x chars to the left/right
nnoremap zl 80zl
nnoremap zh 80zh
" Toggle fold with space, works as normal if no fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Toggle line wrap
map <F9> :set wrap!<CR>
" Bind omni-completion to Ctrl Space
inoremap <C-Space> <C-x><C-o>

"======== Leader Bindings
" Mapping to edit the vimrc quickly
nnoremap <Leader>ev :e $MYVIMRC<CR>
" Mapping to write and source the current file quickly
nnoremap <Leader>sv :w<CR> :so %<CR>
" Format everything quickly
nnoremap <Leader>fa ggVG=
" Change dir globally to active window
nnoremap <Leader>cd :cd%:p:h<CR>
" Hack to close buffer without closing window
nnoremap <Leader>dd :bp<Bar>sp<Bar>bn<Bar>bd<CR>
" Delete trailing whitespace
nnoremap <Leader>dw :%s/\s\+$//<CR>
" Quick way to toggle NERDTreeTabs in current dir
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
" Expand NERDTree to current dir
nnoremap <Leader>ct :NERDTreeFind<CR>
" Quickly remove search highlight
nnoremap <Leader>nn :nohlsearch<CR>
" Toggle Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
" Toggle whitespace visibility
nnoremap <silent> <Leader>sw :set nolist!<CR>
" Toggle rainbow parentheses, workaround for gvim terminal bug
nnoremap <Leader>rp :RainbowParenthesesToggle<CR>
        \ :RainbowParenthesesLoadRound<CR>
        \ :RainbowParenthesesLoadSquare<CR>
        \ :RainbowParenthesesLoadBraces<CR>
        \ :RainbowParenthesesLoadChevrons<CR>
