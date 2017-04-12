set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

if has("win32")
	set langmenu=en
	language messages en
"	source $VIMRUNTIME/vimrc_example.vim
	set directory=.,$TEMP
	set guifont=Consolas:h9:cANSI
    set lines=40 columns=130
    set guiheadroom=0

    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash

    au Filetype html,xml,xsl source C:\Program Files (x86)\Vim\vimfiles\scripts\closetag.vim
    set clipboard=unnamed
elseif has("unix")
    au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
    if has("gui_running")
        set lines=35 columns=110
    endif
    set clipboard=unnamedplus
endif

"Color scheme settings
colo molokai

"General settings
set number
set nowrap
set textwidth=0 wrapmargin=0
set guioptions+=b
set cursorline
set encoding=utf-8
set backspace=indent,eol,start
set autoindent
set showcmd "Show commands in status line
set mouse=a "Enable mouse in terminal
set shell=zsh
syntax on

"Tab settings
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

"Backup settings
set nobackup
set nowritebackup

"Search settings
set ic
set incsearch "Incremental search

"Airline settings
let g:airline_detect_paste=1 "Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 "Show airline for tabs too
set laststatus=2 "Always dispay airline status bar

"Key bindings
map <F12> :1,$ ! xml fo<cr>  
map <F11> :%s/\r\(\n\)/\1/g<cr>
map <F10> :%s/\n//g<cr>
map <C-n> :NERDTreeToggle<cr>

"HTML settings
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Filetype aliases
au BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.asm set filetype=nasm
au BufNewFile,BufRead *.scala set syntax=scala

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

"Latex settings
command Texmode set spell spelllang=en_us wrap linebreak
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'

let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

"CtrlP
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"Markdown
let g:vim_markdown_folding_disabled=1

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'

"YouCompleteMe
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 , 'javascript':1}
let g:ycm_show_diagnostics_ui = 0

"Nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Kernel mode
command Kernelmode set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

"Gitgutter
let g:gitgutter_diff_args = '-w'