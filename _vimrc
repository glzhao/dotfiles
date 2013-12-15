"	FIXME check the formats
"	command					effect		

"	tl					taglist
"	tb					tagbar
"	<Leader>a				Ack

" 	<Leader>c				CtrlP
" 	<Leader>cw				CtrlP cword
" 	<Leader>cf				CtrlP file

"	<Leader>nt				:NERDTreeToggle
"	<Leader>nf				:NERDTreeFind
"
"	<Leader>n				ToggleRelativenumber

"	<Leader>f*				cscope
"
"	F9					make

"	<expr>Tab				Auto completion
"	<expr>S-Tab				Auto completion in reverse order
"	<expr><C-E>				cancel completion
"	<C-J>					<C-X><C-O>
"

"	<Leader>s				Strip all trailing whitespace in current file

"	<Leader>p				MarkdownPreview when opening .markdown file 
"
"	<Tab>					%
"
"	<c-w>o					the current window zooms into a full screen
"	<c-w>o again				the previous set of windows is restored

"	:w!!
"
"	<C-l>					 <c-w>l
"	<C-h>					 <c-w>h
"	<C-k>					 <c-w>k
"	<C-j>					 <c-w>j
"	<C-l>					 <ESC><c-w>l
"	<C-h>					 <ESC><c-w>h
"	<C-k>					 <ESC><c-w>k
"	<C-j>					 <ESC><c-w>j
"
" Only in normal mode
"	<space>					/
"	<c-space>				?
"
"	;					:
"
"
"cabbr %% <C-R>=expand('%:p:h')<CR>
"
""Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F3>
"
""Super paste
""inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"

" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" nose, django-nose

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Pytest
"     Runs your Python tests in Vim.
"
" Commant-T
"     Allows easy search and opening of files within a given path
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Pydoc
"    Opens up pydoc within vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" Py.test
"    Run py.test test's from within vim
"
" MakeGreen
"    Generic test runner that works with nose
"
"
" FIXME check the follow plugins
"" Let Vundle manage Vundle
"Bundle 'gmarik/vundle'
"
"" Navigation
"Bundle 'scrooloose/nerdtree'
"Bundle 'kien/ctrlp.vim'
""Bundle 'EasyMotion.vim'
"Bundle 'Lokaltog/vim-easymotion'
"
"if executable('ack-grep') || executable('ack')
"    Bundle 'mileszs/ack.vim'
"endif
"
"if executable('ctags')
"    Bundle 'majutsushi/tagbar'
"endif
"Bundle 'taglist.vim'
"
"" Automatic Helper
"Bundle 'Shougo/neocomplcache'
"Bundle 'neosnippet'
"Bundle 'Raimondi/delimitMate'
""Shows 'Nth match out of M' every search
"Bundle 'IndexedSearch' 
"Bundle 'auto_mkdir'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'Color-Sampler-Pack'
"
"Bundle 'tpope/vim-surround'
"Bundle 'sickill/vim-pasta'
"Bundle 'ZoomWin'
"
"" Preview 
"Bundle 'SingleCompile'
"
"" C/C++ related
"Bundle 'c.vim'
"
"" Markdown related
"Bundle 'swaroopch/vim-markdown-preview'
"Bundle 'plasticboy/vim-markdown'
"
"" Python related
"" pytest
"" pep8
"" klen/python-mode
"Bundle 'pydoc.vim'
"Bundle 'python.vim--Vasiliev'
"Bundle 'pyflakes.vim'
"Bundle 'rkulla/pydiction'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------
" => General
"------------------------------------------------
set nocompatible		" Don't be compatible with vi
set modeline			" Allow vim options to be embedded in files;
set timeoutlen=500		" Time to wait for a command
set clipboard+=unnamed		" Yanks go on clipboard instead
set confirm			" Y-N-C prompt if closing with unsaved changes.

let mapleader=','		" Change the mapleader
let maplocalleader='\'		" Change the maplocalleader


filetype plugin indent on	" Enable filetype

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set backspace=indent,eol,start " Make backspaces delete sensibly

autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

set nobackup " Turn backup off
"set noswapfile
"set undofile " Set undo
"set history=1000 " Increase the lines of history
"set autowrite " Write on make/shell commands

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Functions 
"--------------------------------------------------
" Platform
function! MySys()
    if has("win32") || has('win64')
	return "windows"
    else
	return "linux"
    endif
endfunction

function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
		\ 'backup': 'backupdir',
		\ 'view': 'viewdir',
		\ 'swap': 'directory',
		\ 'undo': 'undodir'}
    for [dirname, settingname] in items(dir_list)
	let directory=parent.'/'.prefix.'/'.dirname.'/'
	if !isdirectory(directory)
	    if exists('*mkdir')
		call mkdir(directory)
		exec 'set '.settingname.'='.directory
	    else
		echo "Warning: Unable to create directory: ".directory
		echo "Try: mkdir -p ".directory
	    endif
	else
	    exec 'set '.settingname.'='.directory
	endif
    endfor
endfunction

"call InitializeDirectories()

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

"nmap <leader>sb :call SplitScroll()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Vim User Interface
"-------------------------------------------------

set title                     " show title in console title bar
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Set up tab labels
set guitablabel=%m%N:%t\[%{tabpagewinnr(v:lnum)}\]
" Set up tab tooltips with every buffer name
set guitabtooltip=%F

set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3             " Keep 3 context lines above and below the cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

set wrap
"set formatoptions+=rnlmM " Optimize format options
"set fillchars=diff:⣿,vert:│ " Change fillchars
set linebreak               " don't wrap textin the middle of a word

" Set column and line cursor
"autocmd WinLeave * set nocursorline nocursorcolumn
"autocmd WinEnter * set cursorline cursorcolumn
"set cursorcolumn
set cursorline              " have a line indicate the cursor location

set laststatus=2 " Show the statusline

set showcmd " Show cmd
set showmode " display mode INSERT/REPLACE/...

set ruler " show cursor line and column in the status line
set number " Show line numbers
syntax on " Enable syntax

" more schemes http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
colorscheme desert
"colorscheme molokai
set background=dark " Set background

" Only show trailing whitespace when not in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

set mousehide " Hide mouse after chars typed
"set mouse=a " Enable mouse

if !has('gui_running')
    set t_Co=256 " Use 256 colors
endif

if has('gui_running')
    " set behavior for mouse and selection like windows
    behave mswin
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
    set guioptions=egirLtf

    if has('gui_gtk')
	set guifont=Monospace\ 11
    elseif has('gui_win32')
	set guifont=Consolas:h11:cANSI
    endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Platform and encoding Configuration
"-------------------------------------------------

set encoding=utf-8 " Set utf-8 encoding
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,GBK,latin1

" multi-encoding setting
if has("multi_byte")
  " set bomb 
  " set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1 
  " CJK environment detection and corresponding setting 
  if v:lang =~ "^zh_CN" 
    " Use cp936 to support GBK, euc-cn == gb2312 
    set encoding=chinese 
    set termencoding=chinese 
    set fileencoding=chinese 
  elseif v:lang =~ "^zh_TW" 
    " cp950, big5 or euc-tw 
    " Are they equal to each other? 
    set encoding=taiwan 
    set termencoding=taiwan 
    set fileencoding=taiwan 
  "elseif v:lang =~ "^ko" 
  "  " Copied from someone's dotfile, untested 
  "  set encoding=euc-kr 
  "  set termencoding=euc-kr 
  "  set fileencoding=euc-kr 
  endif 
  " Detect UTF-8 locale, and replace CJK setting if needed 
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
    set encoding=utf-8 " Set utf-8 encoding
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,GBK,latin1
  endif 
endif 

" For windows
if MySys() == 'windows'
	" On Windows, also use '.vim' instead of 'vimfiles'
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	source $VIMRUNTIME/mswin.vim
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	set langmenu=zh_CN.UTF-8

	behave mswin

	set diffexpr=MyDiff()
	function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
	    if &sh =~ '\<cmd'
		let cmd = '""' . $VIMRUNTIME . '\diff"'
		let eq = '"'
	    else
		let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	    endif
	else
	    let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Indent and Tab Related
"-------------------------------------------------

set smartindent             " use smart indent if there is no indent file
set autoindent			" Preserve current indent on new lines

"FIXME filetype relates
set softtabstop=8	" Indentation levels every 88888888 columns
set tabstop=8
set shiftround		" Indent/outdent to nearest tabstop
set shiftwidth=8	" Indent/outdent by 8 columns

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Auto complete in VIM 
"-------------------------------------------------
imap <C-J> <C-X><C-O>

""" Insert completion
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete
" don't select first item, follow typing in autocomplete
" FIXME
"set completeopt=menuone,longest,preview
"set pumheight=6             " Keep a small completion window


set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids 'hit enter'

" Ignore these files when completing
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=.git\*,.hg\*,.svn\*        " for Windows
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Search Related
"-------------------------------------------------

set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present

set hlsearch " Highlight search terms
set incsearch " Find as you type search
set magic " changes special characters in search patterns (default)

" Use Tab instead of % to switch among brackets/parenthesis
nnoremap <Tab> %
vnoremap <Tab> %

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Toggle relativenumber
"-------------------------------------------------

function! ToggleRelativenumber()
    if &number==1
	set relativenumber
    else
	set number
    endif
endfunction
nnoremap <Leader>n :call ToggleRelativenumber()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Fold Related
"-------------------------------------------------


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

nmap <F9> :make<CR>

"Map space to / and c-space to ?
nmap <space> /
nmap <c-space> ?

"Fast Ex command
nnoremap ; :

" Keep the cursor in place while joining lines
nnoremap J mzJ`z 

" save as sudo
ca w!! w !sudo tee "%"

cabbr %% <C-R>=expand('%:p:h')<CR>

" Strip all trailing whitespace in the current file
nnoremap <Leader>s :%s/\s\+$//<CR>:let @/=''<CR>

"Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F3>

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Local Setting
"--------------------------------------------------

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Use local gvimrc if available and gui is running
if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
	source ~/.gvimrc.local
    endif
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Plugin configurations  
"--------------------------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => scrooloose/nerdtree
"--------------------------------------------------

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.vim$', '\~$','\.o$']
let NERDTreeMapActivateNode="<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => kien/ctrlp.vim
"--------------------------------------------------

let g:ctrlp_map = ',c'
nmap <Leader>cw :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <Leader>cf :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>

nmap <Leader>cm :CtrlPMRUFiles<CR>
nmap <Leader>cn :CtrlPLine<CR>
nmap <Leader>cl :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <Leader>cg :CtrlPBufTag<CR>
nmap <Leader>cb :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Easymotion.vim
"--------------------------------------------------

let g:EasyMotion_leader_key = '<Leader><Leader>'

"    Mapping           | Details          
"    ------------------|----------------------------------------------
"    <Leader>f{char}   | Find {char} to the right. See f.
"    <Leader>F{char}   | Find {char} to the left. See F.
"    <Leader>t{char}   | Till before the {char} to the right. See t.
"    <Leader>T{char}   | Till after the {char} to the left. See T.
"    <Leader>w         | Beginning of word forward. See w.
"    <Leader>W         | Beginning of WORD forward. See W.
"    <Leader>b         | Beginning of word backward. See b.
"    <Leader>B         | Beginning of WORD backward. See B.
"    <Leader>e         | End of word forward. See e.
"    <Leader>E         | End of WORD forward. See E.
"    <Leader>ge        | End of word backward. See ge. 
"    <Leader>gE        | End of WORD backward. See gE.
"    <Leader>j         | Line downward. See j.
"    <Leader>k         | Line upward. See k.
"    <Leader>n         | Jump to latest "/" or "?" forward. See n.
"    <Leader>N         | Jump to latest "/" or "?" backward. See N.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => mileszs/ack.vim'
"--------------------------------------------------

if has('unix') && executable('ack-grep')
    let g:ackprg='ack-grep -H --nocolor --nogroup --column'
endif

if executable('ack-grep') || executable('ack')
    nnoremap <Leader>a :Ack!<Space>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => tagbar
"--------------------------------------------------

map <silent>tb :TagbarToggle<CR>

let g:tagbar_width = 40
let g:tagbar_expand = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => taglist
"--------------------------------------------------

map <silent>tl :TlistToggle<CR>

if MySys() == "windows"
	let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

let Tlist_Use_Right_Window=1
let Tlist_Exit_Only_Window=1
let Tlist_File_Fold_Close=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Inc_Winwidth = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => neocomplcache
"--------------------------------------------------

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_delimiter=1
"let g:neocomplcache_enable_camel_case_completion=1
"let g:neocomplcache_enable_underbar_completion=1

" Map <C-E> to cancel completion
inoremap <expr><C-E> neocomplcache#cancel_popup()
inoremap <expr><S-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$HOME/.vim/bundle/snipmate-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility=1

" Plugin key-mappings
imap <C-K> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior
inoremap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-N>" : "\<TAB>"
snoremap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"

" For snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

"FIXME conflict with above settings
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

" CR/S-CR: close popup and save indent
inoremap <expr><CR> delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : pumvisible() ? neocomplcache#close_popup() : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => IndexedSearch
"--------------------------------------------------

let g:indexed_search_colors=0
let g:indexed_search_shortmess=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => auto_mkdir 
"--------------------------------------------------

" No configuration

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-powerline
"--------------------------------------------------

"set guifont=PowerlineSymbols\ for\ Powerline
"set t_Co=256
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Color-Sampler-Pack 
"--------------------------------------------------
"
"FIXME TODO

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-surround 
"--------------------------------------------------
"
"FIXME TODO
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-pasta 
"--------------------------------------------------
"
"FIXME TODO
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Zoomwin 
"--------------------------------------------------
"
"map <C-w>o :ZoomWin<CR>  
" <c-w>o	: the current window zooms into a full screen
" <c-w>o again	: the previous set of windows is restored

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Singlecompile   
"--------------------------------------------------
"
"FIXME found new key
"nmap <F9> :SCCompile<cr>
"nmap <F10> :SCCompileRun<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => c.vim 
"--------------------------------------------------
"
"FIXME 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-markdown-preview  
"--------------------------------------------------

"autocmd Filetype markdown nnoremap <buffer> <Leader>p :MarkdownPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-markdown  
"--------------------------------------------------

let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => pydoc.vim 
"--------------------------------------------------

"FIXME find new mapkey
"view the documentation of a python-module or class by typing 
":Pydoc foo.bar.baz (e.g. :Pydoc re.compile)
"
" K :open pydoc

"search a word (uses pydoc -k) in the documentation by typing
":PydocSearch foobar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => python.vim--Vasiliev 
"--------------------------------------------------
"
" no configuration files
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => pydiction 
"--------------------------------------------------

"let g:pydiction_location = '/path/to/complete-dict'
"let g:pydiction_menu_height = 20
"autocmd FileType python set complete+=k/path/to/pydiction iskeyword+=.,()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => cscope
"--------------------------------------------------

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    if MySys() == "linux"
      set csprg=/usr/bin/cscope
    else
      set csprg=cscope
    endif

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=1
    set nocscopeverbose
    " add any cscope database in current directory
    if filereadable("cscope.out")
	cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings

    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "
    nmap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <Leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <Leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <Leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

    """"""""""""" key map timeouts
    "set ttimeoutlen=100

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Filetype Specific
"-------------------------------------------------
"
" C 
augroup ft_c
    autocmd!
    autocmd Filetype c set cindent softtabstop=8 shiftwidth=8 tabstop=8 textwidth=80 colorcolumn=81
    autocmd Filetype c hi ColorColumn ctermbg=lightRed guibg=lightRed
augroup END

augroup ft_cpp
    autocmd!
    autocmd Filetype cpp set cindent softtabstop=8 shiftwidth=8 tabstop=8 textwidth=80 colorcolumn=81
    autocmd Filetype cpp set ts=8 sw=2 smarttab 
    autocmd Filetype cpp hi ColorColumn ctermbg=lightRed guibg=lightRed
augroup END

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>p to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>p :MarkdownPreview<CR>
augroup END

" Perl
augroup ft_perl
    let perl_include_pod=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    autocmd!
    autocmd filetype perl iab pusc use warnings;<CR>use strict;<CR>use Carp;<CR>
    autocmd filetype perl setlocal keywordprg=perldoc\ -f
augroup END

" Python
augroup ft_python
    autocmd!
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 colorcolumn=80 smartindent 
    au Filetype python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

    au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    " Don't let pyflakes use the quickfix window
    let g:pyflakes_use_quickfix = 0

    "----------------------------------------------------------------------------------------
    " => pydiction    
    "----------------------------------------------------------------------------------------
    let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
    let g:pydiction_menu_height = 20


    " code folder
    "autocmd FileType python setlocal foldmethod=indent
    "set foldlevel=99 "默认展开所有代码
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"FIXME"
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

"<CR><C-w>l<C-f>:set scrollbind<CR>

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Run pep8
let g:pep8_map='<leader>8'

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" ==========================================================
" Basic Settings
" ==========================================================
" FIXME
set grepprg=ack         " replace the default grep program with ack

""" Moving Around/Editing
set virtualedit=block       " Let cursor move past the last char in <C-v> mode


" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ===========================================================
" FileType specific changes
" ============================================================
" FIXME
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

if exists("&colorcolumn")
   set colorcolumn=79
endif
