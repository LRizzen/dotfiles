set number
set relativenumber
set secure
set hidden
set wildmenu
set wildmode=longest:list,full
set virtualedit=
set ruler
set showcmd
set incsearch
set noerrorbells
set modeline

set scrolloff=5
set fillchars+=vert:\

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"IDENTATION

set autoindent
set shiftwidth=2
set tabstop=8
set softtabstop=8
set expandtab
set cindent
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
set listchars=tab:··
set list

set splitbelow

"au BufNewFile,BufRead *.py
"    \ set autoindent |
"    \ set shiftwidth=4 |
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set fileformat=unix

set backspace=indent,eol,start

set notimeout
set ttimeout

set nobackup
set wildignore=*.o,*.obj,*.bak,*.exe,*.out

filetype plugin indent on
syntax on

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'soft'
set background=dark
colorscheme gruvbox


"KEYBINDINGS

let mapleader=","

nmap <Tab> ==
imap <Tab> <C-v><Tab>

nmap <Leader>p :set relativenumber!<CR>

nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-j> :bf<CR>
nmap <C-k> :bl<CR>
nmap <C-d> :bd<CR>
"nmap <M-k> :wincmd k<CR>
"nmap <M-j> :wincmd j<CR>
"nmap <M-h> :wincmd h<CR>
"nmap <M-l> :wincmd l<CR>

map <Left> <NOP>
imap <Left> <NOP>
map <Right> <NOP>
imap <Right> <NOP>
map <Up> <NOP>
imap <Up> <NOP>
map <Down> <NOP>
imap <Down> <NOP>

" AUTOCMD

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

"PLUGINS

call plug#begin('/home/rizzen/.vim/plugged')

"Base
Plug 'tpope/vim-sensible'

"Theme
Plug 'morhetz/gruvbox'

"Git
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

"FileTools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'ctrlpvim/ctrlp.vim'

"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 "JS
 Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
 Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
 Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

"Syntax
 "JS
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'othree/yajs.vim'
 Plug 'othree/es.next.syntax.vim'

"Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Lint
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'

"NodeJS
Plug 'moll/vim-node'

"Other
Plug 'scrooloose/nerdcommenter'
Plug 'chilicuil/vim-sprunge'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mklabs/split-term.vim'

call plug#end()

" CTRLP "

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v(\.d|\.o|\.swp|\~)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" AIRLINE "
set encoding=utf8
set guifont=Knack\ Nerd\ Font:style=Regular\ 10
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

nmap <C-t> <plug>NERDTreeTabsToggle<CR>

" NERDTREE "
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.o$', '\~$']
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeMouseMode = 1

" Colors by filetype
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#141e23')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#141e23')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#141e23')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#141e23')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', '#141e23')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#141e23')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#141e23')

" NERDTREE-GIT "

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" GITGUTTER "
set updatetime=100

" DEVICONS "

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" DEOPLETE "
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
autocmd CompleteDone * pclose!

" NEOMAKE "
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" JAVASCRIPT "
let g:javascript_plugin_jsdoc = 1
let g:javascript_enable_domhtmlcss = 1
set conceallevel=1

" ULTISNIPS "
let g:UltiSnipsExpandTrigger = "<C-S>"
