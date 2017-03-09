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

set scrolloff=5
set fillchars+=vert:\

let mapleader=" "

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

set backspace=indent,eol,start

set notimeout
set ttimeout

set nobackup
set wildignore=*.o,*.obj,*.bak,*.exe,*.out

filetype plugin indent on


let python_highlight_all = 1
syntax on

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'soft'
set background=dark
colorscheme gruvbox


"KEYBINDINGS

nmap <Tab> ==
imap <Tab> <C-v><Tab>

nmap <Leader><p> :set relativenumber!<CR>

nmap <C-t> :NERDTreeToggle<CR>
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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chilicuil/vim-sprunge'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'digitaltoad/vim-pug'
Plug 'djoshea/vim-autoread'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isruslan/vim-es6'
Plug 'morhetz/gruvbox'

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

" YOUCOMPLETEME "
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

"highlight YcmErrorSign ctermfg=red
"highlight YcmErrorSection cterm=underline ctermfg=red
"highlight YcmWarningSign ctermfg=yellow
"highlight YcmWarningSection cterm=underline ctermfg=yellow

map <F8> :YcmCompleter FixIt<CR>

" DELIMITMATE "
let g:delimitMate_expand_cr = 1

" SYNTASTIC "

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"highlight SyntasticErrorSign ctermfg=red
"highlight SyntasticError cterm=underline ctermfg=red
"highlight SyntasticWarningSign ctermfg=yellow
"highlight SyntasticWarning cterm=underline ctermfg=yellow

" JAVASCRIPING "
let g:javascript_enable_domhtmlcss = 1

" ULTISNIPS "
let g:UltiSnipsExpandTrigger = "<C-S>"

" EPIHEADERS "
source /home/rizzen/.vim/epitech.vim
