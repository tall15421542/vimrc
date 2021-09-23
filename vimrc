" let vim work better without vi-compatible
set nocompatible

syntax enable
set ignorecase
set smartcase
set clipboard=unnamed

" filetype: 
filetype plugin on
au BufRead,BufNewFile,BufWritePre *.js set filetype=javascript

" PlugIn:
" Vundle.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript' 
Plugin 'fatih/vim-go'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

v" syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" javascript syntax
autocmd bufnewfile,bufread *.js set filetype=javascript.js

" File search:
" search file recursively into subfolder
" Provides tab-complete for all file-related task
set path+=**

" Display all matching file when we tab complete
set wildmenu

" :b means buffer. I can auto-complete any open buffer
" :ls can check the buffer

" TAG-jumping:
command! MakeTags !ctags -R .

" use ^] to jump to tag under cursor
" use g^] to for ambiguous tags
" use ^t to jump back up the tag stack

" AUTOCOMPLETE:
" ^x^n for JUST this file
" ^x^f for filenames
" ^x^] for tags only
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"

" SNIPPETS:
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" File name in statusline:
set laststatus=2
set statusline=%#filepath#[%f]%m%r%h%w%#filetype#[%Y]%#position#[%l/%L][%3p%%]
hi filepath cterm=none ctermbg=238 ctermfg=39
hi filetype cterm=none ctermbg=238 ctermfg=30
hi position cterm=none ctermbg=238 ctermfg=69

" Indent setting:
filetype indent on
set tabstop=2 shiftwidth=2 expandtab

" Line number setting
set number
highlight LineNr ctermfg=grey

" cursor:
set cursorline
hi CursorLine cterm=none ctermbg=23 ctermfg=White

" search:
set hlsearch
hi Search cterm=reverse ctermbg=none ctermfg=none
hi comment ctermfg=lightcyan

" Folding
au BufWinLeave * mkview
au BufWinEnter * silent loadview



