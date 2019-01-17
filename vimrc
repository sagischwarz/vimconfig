set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'luochen1990/rainbow'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-sleuth'
Plugin 'Chiel92/vim-autoformat'

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

" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

"Color scheme settings
colorscheme onedark

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
set wildmenu
set scrolloff=3
set autoread
syntax on
set synmaxcol=250
set undofile
set undodir=~/.cache/vimundo
set splitbelow
set splitright

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

"Change working directory to current file
autocmd BufEnter * silent! lcd %:p:h

"Airline settings
let g:airline_detect_paste=1 "Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 "Show airline for tabs too
let g:airline#extensions#ale#enabled = 1
set laststatus=2 "Always dispay airline status bar

"Key bindings
nmap <F12> :%!jq '.'<cr>
nmap <F11> :%s/\r\(\n\)/\1/g<cr>
nmap <F10> :%s/\n//g<cr>
nmap <Leader>n :NERDTreeToggle<cr>

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

"fzf
nmap <C-p> :Files<CR>
nmap <Leader>t :Tags<CR>
nmap ; :Buffers<CR>

"ack.vim
let g:ackprg = 'ag --vimgrep'

function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()

"Markdown
let g:vim_markdown_folding_disabled=0

"YouCompleteMe
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 , 'javascript':1, 'typescript':1}
let g:ycm_show_diagnostics_ui = 0

"Nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen=1

"Kernel mode
command Kernelmode set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

"Gitgutter
let g:gitgutter_diff_args = '-w'

"EasyMotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

"Matchit
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_width = 120

"Rainbow
let g:rainbow_active = 1

"ale
let g:ale_sign_column_always = 1
