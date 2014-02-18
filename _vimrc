" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Ack (mileszs/ack.vim.git)
"
" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"	Better Management of VIM plugins
"
" GunDo (sjl/gundo.vim.git)
"	Visual Undo in vim with diff's to check the differences
"
" Fugitive (tpope/vim-fugitive.git)
"	Interface with git from vim
"
" Nerdtree
"	allows you to explore your filesystem and to open files and directories
"
" ctrlp.vim
"	Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"
" TaskList
"	List file for fixme, todo, and xxx (or a custom list)
"
" vim-easymotion.git
"	provides a much simpler way to use some motions in vim.
"
" tagbar.git
"	browsing the tags of source code files
"
" SingleCompile.git
"	making it more convenient to compile or run a single source file without leaving vim.
"
" vim-airline
"	a statusline plugin for vim, 
"
" IndexedSearch
"	shows 'Nth match out of M' at every search 
"
" delimitMate.git
"	provides automatic closing of quotes, parenthesis, brackets, etc
"		
" neocomplcache or neocomplete (if Vim 7.3.885 or above with if_lua feature)
"	provides keyword completion system by maintaining a cache of keywords
" neosnippet
"	small templates for commonly used code that you can fill in on the fly
" neosnippet-snippets
"	The standard snippets repository for neosnippet
"
" vim-colors-solarized
"	precision colorscheme for the vim text editor	
"
" syntastic
"	Syntax checking hacks for vim
" C.vim
"	C/C++ IDE
"
" vim-markdown
"	Markdown Vim Mode	
"
" Python-mode (klen/python-mode)
"	create python code very quickly by utilizing libraries including pylint,
"	rope, pydoc, pyflakes, pep8, and mccabe for features like static analysis,
"	refactoring, folding, completion, documentation, and more
"
" FOR python develop
" Pytest (alfredodeza/pytest.vim.git)
"	Runs your Python tests in Vim.
" PyFlakes
"	Underlines and displays errors with Python on-the-fly
" Pydoc (fs111/pydoc.vim.git)
"	Opens up pydoc within vim
" Py.test 
"	Run py.test test's from within vim
" rope-vim.git
"	Pathogen compatable ropevim plugin	
" Pydiction.git
"	Tab-complete your Python code
" pep8.git
"	Check your python source files with PEP8
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------
" <Leader>a  	: 	Ack
"
" <leader>g	:	GundoToggle
"
" <Leader>c  	: 	CtrlP
"
" <Leader>cw 	: 	CtrlP cword
" <Leader>cf 	: 	CtrlP file
" <Leader>cl	:	CtrlP line 
"
" <Leader>ne 	: 	:NERDTreeToggle
" <Leader>nf 	: 	:NERDTreeFind
"
" <Leader>f* 	: 	cscope
"
" <leader>sb	:	SplitScroll()
" <Leader>n	:	ToggleRelativenumber()
"
" tl		:	TaskList
" tb		:	tagbar
"
" <F9>		:	SCCompileRun
"
" <C-k>		:	neosnippet_expand_or_jump
" <expr><C-l>	:	neocomplcache#complete_common_string()
"
" <expr><C-g>	:	neocomplcache#undo_completion()
" <C-E>		: 	cancel completion
"
" <C-h>, <BS>	:	close popup and delete backword char.
" <expr><C-h>	:	neocomplcache#smart_close_popup()."\<C-h>"
" <expr><C-y>  	:	neocomplcache#close_popup()
"
" Python-mode
" <leader>r	:	Run python code
" <leader>b	:	Add/remove breakpoints
" K		:	Search in python documentation
" :PymodeLint	:	Code checking that can be run simultaneously
" :PymodeLintToggle*
"		:	Toggle code checking
" :PymodeLintAuto*
"		:	Fix PEP8 errors in current buffer automatically
" <C-c>g :RopeGotoDefinition
"		:	Go to definition
"	Python motions and operators (]], 3[[, ]]M, vaC, viM, daC, ciM, ...)
"	
"	Super paste
"	inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" Use Tab instead of % to switch among brackets/parenthesis
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap ; :

cabbr %% <C-R>=expand('%:p:h')<CR>

imap <C-J> <C-X><C-O>

" save as sudo
ca w!! w !sudo tee "%"

" Strip all trailing whitespace in the current file
nnoremap <Leader>s :%s/\s\+$//<CR>:let @/=''<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Pathogen - Allows us to organize our vim plugins
"-------------------------------------------------
" Load pathogen with docs for all plugins
set nocompatible		" Don't be compatible with vi
filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"execute pathogen#infect()
call pathogen#infect()
syntax on			" Enable syntax
filetype plugin indent on	" Enable filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------
" => General
"------------------------------------------------
set nocompatible		" Don't be compatible with vi
set modeline			" Allow vim options to be embedded in files;
set confirm			" Y-N-C prompt if closing with unsaved changes.
set clipboard+=unnamed		" Yanks go on clipboard instead
set backspace=indent,eol,start	" Make backspaces delete sensibly

let mapleader=','		" Change the mapleader
let maplocalleader='\'		" Change the maplocalleader
set timeoutlen=500              " Time to wait for a command

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Virtual editing means that the cursor can be positioned where there is
" no actual character. could let cursor move past the last char in <C-v> mode
set virtualedit=block

set shortmess=at		" avoid all the |hit-enter| prompts caused by file messages

set viewoptions+=slash,unix	" Better Unix/Windows compatibility
autocmd BufWinLeave *.* silent! mkview
				" Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview
				" Make Vim load view (state) (folds, cursor, etc)

filetype plugin indent on	" Enable filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Functions
"--------------------------------------------------
function! MySys()
    if has("win32") || has('win64')
	return "windows"
    else
	return "linux"
    endif
endfunction

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu
nmap <leader>sb :call SplitScroll()<CR>

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
" => Vim User Interface
"-------------------------------------------------
set ruler			" show cursor line and column in the status line
set number			" Show line numbers
set linebreak			" don't wrap textin the middle of a word
set showmatch			" Show matching brackets/parenthesis

set fillchars=diff:⣿,vert:│	" Change fillchars
set background=dark		" Set background
set formatoptions+=rnlmM	" Optimize format options

syntax on			" Enable syntax

set laststatus=2		" Show the statusline

set title			" show title in console title bar
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Set up gvim tab labels
set guitablabel=%m%N:%t\[%{tabpagewinnr(v:lnum)}\]
set guitabtooltip=%F		" Set gvim tab tooltips with every buffer name

set scrolljump=5		" Lines to scroll when cursor leaves screen
set scrolloff=3			" Keep 3 context lines above and below the cursor

" Set column and line cursor
set cursorline cursorcolumn
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn

" Only show trailing whitespace when not in insert mode with :l[ist]
augroup trailing
	autocmd!
	autocmd InsertEnter * :set listchars-=trail:⌴
	autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

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
else
	set t_Co=256 " Use 256 colors
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Platform and encoding Configuration
"-------------------------------------------------
set fileencodings=ucs-bom,utf-8,GBK,latin1
set fileformats=unix,mac,dos	" Auto detect the file formats

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Indent and Tab Related
"-------------------------------------------------
set autoindent		" Preserve current indent on new lines
set smartindent		" use smart indent if there is no indent file

" keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4 (or whatever you prefer)
" and use 'noexpandtab'. Then Vim will use a mix of tabs and spaces, but typing <Tab>
" and <BS> will behave like a tab appears every 4 (or whatever you set before) characters.
set noexpandtab tabstop=8 softtabstop=8
" Round indent to multiple of 'shiftwidth, used for cindent, >>, <<, etc
set shiftround shiftwidth=8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Auto complete in VIM
"-------------------------------------------------
set wildmenu			" Show list instead of just completing
set wildmode=list:longest,full	" Use powerful wildmenu
" Ignore these files when completing
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*	" for Linux/MacOSX
set wildignore+=.git\*,.hg\*,.svn\*		" for Windows
set wildignore+=*.o,*.obj,.git,*.pyc

set completeopt+=longest	" Optimize auto complete

" Automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => Search Related
"-------------------------------------------------
set ignorecase			" Case insensitive search
set smartcase			" Case sensitive when uc present

set hlsearch			" Highlight search terms
set incsearch			" Find as you type search
set magic			" changes special characters in search patterns (default)

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv
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
" => GunDo
"--------------------------------------------------

map <leader>g :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => TaskList
"--------------------------------------------------
map <silent>tl :TaskList<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Fugitive
"--------------------------------------------------
" TODO Investigate it futher
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-colors-solarized
"--------------------------------------------------
" TODO Investigate it futher
syntax enable
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => scrooloose/nerdtree
"--------------------------------------------------
" turn off the plug at the start
" let loaded_nerd_tree=0

nnoremap <Leader>ne :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
"let NERDTreeChDirMode=2
"let NERDTreeShowBookmarks=1
"let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
"let NERDTreeDirArrows=1
"let NERDTreeIgnore=['\.vim$', '\~$','\.o$']
"let NERDTreeMapActivateNode="<CR>"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => kien/ctrlp.vim
"--------------------------------------------------
let g:ctrlp_map = '<Leader>c'
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
if has('unix')
	if executable('ack-grep') || executable('ack')
		let g:ackprg='ack-grep -H --nocolor --nogroup --column'
	endif
endif

if executable('ack-grep') || executable('ack')
    nnoremap <Leader>a :Ack!<Space>
endif 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => tagbar
"--------------------------------------------------
map <silent>tb :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_expand = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => neocomplcache
"--------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

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
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" This option controls whether neocomplcache insert delimiter
" automatically.  For example, /(filename) or #(Vim script).
let g:neocomplcache_enable_auto_delimiter=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => neosnippet
"--------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$HOME/.vim/bundle/neosnippet-snippets/neosnippets'
let g:neosnippet#enable_snipmate_compatibility=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => delimitMate
"--------------------------------------------------
let delimitMate_expand_cr=1
"let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

" CR/S-CR: close popup and save indent
inoremap <expr><CR> delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : pumvisible() ? neocomplcache#close_popup() : "\<CR>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => IndexedSearch
"--------------------------------------------------
let g:indexed_search_shortmess=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-airline 
"--------------------------------------------------
" enable iminsert detection
let g:airline_detect_iminsert=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Singlecompile
"--------------------------------------------------

nmap <F9> :SCCompileRun<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => c.vim
"--------------------------------------------------
" TODO Investigate it futher
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vim-markdown
"--------------------------------------------------
" set the initial foldlevel. Defaults is 0 (i.e. all folds are closed)
let g:vim_markdown_initial_foldlevel=1

" "]]: go to next header.
" "[[: go to previous header. Contrast with ]c.
" "][: go to next sibling header if any.
" "[]: go to previous sibling header if any.
" "]c: go to Current header.
" "]u: go to parent header (Up).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => python-mode 
"--------------------------------------------------
"Run python code (<leader>r)
"Add/remove breakpoints (<leader>b)
"Python motions and operators (]], 3[[, ]]M, vaC, viM, daC, ciM, ...)
"Code checking (pylint, pyflakes, pylama, ...) that can be run simultaneously (:PymodeLint)
"Autofix PEP8 errors (:PymodeLintAuto)
"Search in python documentation (K)
"Strong code completion (rope)
"Go to definition (<C-c>g for :RopeGotoDefinition)
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
" C
augroup ft_c
    autocmd!
    autocmd Filetype c setlocal cindent noexpandtab softtabstop=8 tabstop=8 shiftround shiftwidth=8
    autocmd Filetype c setlocal textwidth=80 colorcolumn=81
    autocmd Filetype c hi ColorColumn ctermbg=lightRed guibg=lightRed
augroup END

augroup ft_cpp
    autocmd!
    autocmd Filetype cpp setlocal cindent noexpandtab softtabstop=8 tabstop=8 shiftround shiftwidth=8
    autocmd Filetype cpp setlocal textwidth=80 colorcolumn=81
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
    au FileType python setlocal smartindent expandtab shiftwidth=4 tabstop=8 softtabstop=4 colorcolumn=80
    au Filetype python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

    au BufRead *.py setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
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
