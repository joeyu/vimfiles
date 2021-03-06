" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
    autocmd BufNewFile,BufRead *.wxml set filetype=html
    autocmd BufNewFile,BufRead *.wxss set filetype=css
    filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set nobackup            " No backup file after editing
set nu                  " Show line numbers
set encoding=utf-8

"set colorcolumn=80
"highlight ColorColumn ctermbg=Grey

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" Tab settings
set tabstop=8
set expandtab       " Expand tab with `softtabstop`
set softtabstop=4
set shiftwidth=4
set smarttab        " Opt for `shiftwidth` for indention
set smartindent

" Automatically show preview window for C symbols
:set tags=tags;
:set previewheight=12
:set updatetime=800
" :au! CursorHold *.[ch] nested exe "silent! botright ptag " . expand("<cword>")

" Pathogen & its plugins
" runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()

" Vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-syntastic/syntastic'
Plugin 'hdima/python-syntax'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
" Vundle end


" Toggle Taglist
nmap <F8> :TagbarToggle<CR>

" Toggle NERDTree
map <silent> <F7> :NERDTree<CR>

" Python
" Flake8 python syntax check
autocmd FileType  python nmap <buffer> <F3> :call Flake8() <CR>
autocmd FileType  python let python_highlight_all = 1


" YMC
nnoremap <silent> <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"let g:jsbeautify = {'indent_size': 4, 'indent_char': '\t'}
"let g:htmlbeautify = {'indent_size': 4, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
"let g:cssbeautify = {'indent_size': 4, 'indent_char': ' '}

if !exists("autocommands_loaded")
    let autocommands_loaded = 1


    " map <c-f> :call JsBeautify()<cr>
    " or
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
endif



" Map `\s` to replace the current word
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


map <C-K> :py3f /usr/share/vim/addons/syntax/clang-format.py<cr>

