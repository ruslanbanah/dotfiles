set nocompatible              " be iMproved, required
filetype off                  " required
scriptencoding utf-8
set encoding=utf-8

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'cohama/agit.vim'
Plug 'flazz/vim-colorschemes'
Plug 'danro/rename.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'eparreno/vim-l9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'jlanzarotta/bufexplorer'
Plug 'bkad/CamelCaseMotion'
Plug 'sjl/gundo.vim'

"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }
Plug 'mxw/vim-jsx', { 'for': 'javascript'  }
Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript'  }
Plug 'othree/yajs.vim', { 'for': 'javascript'  }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript'  }

Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript'  }

Plug 'sickill/vim-pasta', { 'for': 'javascript'  }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'for': 'javascript'  }

"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript']  }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript']  }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript']  }
Plug 'tpope/vim-haml', { 'for': 'haml' }
"CSS/LESS/Stylus/SCSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus']  }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass']  }
Plug 'groenewege/vim-less', { 'for': 'less'  }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss']  }
Plug 'wavded/vim-stylus', { 'for': 'stylus'  }"

"Vue
"Plug 'posva/vim-vue'

"python
"Plug 'vim-scripts/indentpython.vim'


"collor chemas"
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim'


call plug#end()

syntax on

let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

"System
"autocmd bufwritepost *.js silent !standard-format --fix -w %
set autoread

colorscheme onedark

let g:solarized_termcolors=256
let g:mapleader=' '
set background=dark
set number
set expandtab
set tabstop=2
set shiftwidth=2
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set backupcopy=yes
set clipboard=unnamed
set backspace=indent,eol,start
set undofile
set undodir=~/.vim/undodir
let g:localvimrc_file = '.vimrc'
set directory=~/.vim/swap
set backupdir=~/.vim/backups

set hlsearch
set incsearch

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" statusline
  :set statusline=%{fugitive#statusline()}\ %L\ %f

" NERDTree
  map <Leader>N :NERDTreeToggle<CR>
  map <Leader> <Plug>(easymotion-prefix)
  nmap <Leader>n :NERDTreeFind<CR>
  autocmd VimEnter * NERDTree
  autocmd vimenter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Tags
  set tags=./tags;/
  map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
  map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Aliases
  command! FStandard ! standard-format --fix -w %
  command! FEslint ! eslint -c ./.eslintrc --fix %


"Tabs -> buffers
set modifiable


" FZF
set rtp+=~/.fzf
map <C-f> :FZF<CR>
map <C-e> :BufExplorerVerticalSplit<CR>

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" JS
noremap <F3> :ALEFix<CR>
let g:formatdef_prettier_javascript = '"prettier"'

let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

" python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" remove whitespaces in line
au BufWritePre * %s/\s\+$//e

" CamelCaseMotion config
call camelcasemotion#CreateMotionMappings(',') " should add , to movements - default like ',m', ',e'

" gundo config
let g:gundo_prefer_python3 = 1
