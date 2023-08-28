scriptencoding utf-8
" vimrc: just the essentials

" vim.config[general] {{{1
	if has('vim_starting') "{{{
		set nocompatible
		filetype plugin indent off
		let s:nope=&loadplugins
		set all&
		let $MYVIMRC=resolve(expand("<sfile>"))
		let $VIM=substitute(fnamemodify($MYVIMRC, ":p:h"), '\', '/', 'g')
		let $VIMRUNTIME=substitute($VIMRUNTIME, '\', '/', 'g')
		let $VIMFILES=expand("$VIM/vimfiles")
		let $VIMINFO=expand("$VIM/viminfo")
		set runtimepath=$VIMFILES,$VIMRUNTIME,$VIMFILES/after
		set cpoptions&vim
		set cpoptions+=$
		set viminfo=f1,'20,<0,h,n$VIMINFO
	endif "}}}
	set autoread
	set grepprg=internal
	set spelllang=en_us
	set modeline
	set modelines=5
	set virtualedit=block
	set title
	set titlelen=0
	set ttimeoutlen=50
	set splitbelow
	set splitright
	set pastetoggle=<Ins>

" vim.config[keyword] {{{1
	set complete=.,w,t,i,k
	" set completeopt=menu,noinsert,noselect
	set completeopt=popup,menu,noinsert,noselect
	set completepopup=border:off,highlight:Pmenu ",align:flip
	set previewpopup=height:10,width:60

" vim.config[backup] {{{1
	set undofile
	set backup

" vim.config[ui] {{{1
	set history=100
	set noconfirm
	set wildmenu
	set wildignore=*.exe,*.dll,*.o,*.obj,*.bak,*.pyc,*.gif,*.jpg,*.png
	set wildmode=longest:full,full
	set wildoptions=fuzzy,pum
	set backspace=indent,eol,start
	set whichwrap+=<,>,[,]
	set nolazyredraw
	set display=lastline
	set cmdheight=2
	set errorbells
	set scrolloff=3
	set sidescroll=10
	set sidescrolloff=5
	set selection=old
	set winheight=1
	set mousemodel=popup_setpos
	set shortmess=aT
	set selectmode=
	set clipboard=autoselect
	set switchbuf=usetab,newtab
	set ignorecase
	set infercase
	set smartcase
	set nojoinspaces
	set laststatus=2
	let loaded_matchparen=1
	let no_buffers_menu=1
	set background=dark
	if has("patch-8.1.0360")
		set diffopt=internal,horizontal,filler,closeoff,algorithm:patience,iwhite,iwhiteall
	endif

" vim.config[visual] {{{1
	set noshowmode
	set showmatch
	set hlsearch
	set incsearch
	set matchtime=5

" vim.config[folding] {{{1
	set foldenable
	set foldmarker={{{,}}}
	set foldmethod=marker
	set foldlevelstart=0
	set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
	nnoremap <Space> za
	vnoremap <Space> za

	set foldtext=vimrc#dumb_fold_text()

" vim.config[formatting] {{{1
	set autoindent
	set smartindent
	set softtabstop=4
	set tabstop=4
	set shiftwidth=4
	set shiftround
	set nowrap
	set textwidth=80
	set formatoptions=rq
	set encoding=utf-8
	set fileencodings=ucs-bom,utf-8,cp437,ucs-2le

" vim.config[home] {{{1
	let &backupdir = vimrc#make_local_dir('backup')
	let &viewdir   = vimrc#make_local_dir('views')
	let &directory = vimrc#make_local_dir('swap')
	let &undodir   = vimrc#make_local_dir('undo')
	let $CACHE     = vimrc#make_local_dir('cache')
	let &spellfile = vimrc#make_vimfiles_dir('spell') .. '/en.utf-8.add'

" vim.config[plugin] {{{1
	call vimrc#fixterm()
	if 1 && &loadplugins
		filetype plugin indent off
		syntax off
		call vimrc#source_rc('plugins.rc.vim')
		set omnifunc=syntaxcomplete#Complete
	endif \" &loadplugins

" vim.config[syntax] {{{1
	filetype plugin indent on
	syntax on

" vim.config[colors] {{{1
	try
		colors gruvbox
	catch //
		colors pablo
	endtry
	" colors mycolors

" vim.autocommands {{{1
	augroup vimrc
	au!
	autocmd InsertLeave     *                   nested if pumvisible()==0 | pclose | endif
	autocmd InsertLeave     *                   nested set nopaste
	autocmd SourcePre       */macros/less.vim   set laststatus=0 cmdheight=1
	" autocmd FilterWritePre  *                   if &diff | colorscheme distinguished | AirlineRefresh | endif
	augroup END

" vim.commands {{{1
	if has('unix')
		command! -bar -nargs=0 W silent! exec "write !sudo tee % >/dev/null" | silent! edit!
	else
		cabbrev W w
	endif

" vim.abbreviations {{{1
	cabbrev         Q               q
	cabbrev         ~v              $VIMFILES
	cabbrev         ~r              $VIMRUNTIME

" vim.keys {{{1
	" remove search highlight with Ctrl-L
	nnoremap	<silent>	\\			:nohl<CR><C-L>
	" return to previous location after repeated command
	nmap					.			.`[
	" use extra special regex
	nnoremap				/			/\v
	vnoremap				/			/\v
	cnoremap				s/			s/\v
	" recover visual selection after shift
	vnoremap	<silent>	<			<gv
	vnoremap	<silent>	>			>gv

	" window movement
	nnoremap	<silent>	<C-h>		<C-W>h
	nnoremap	<silent>	<C-j>		<C-W>j
	nnoremap	<silent>	<C-k>		<C-W>k
	nnoremap	<silent>	<C-l>		<C-W>l

	" keep matches in the center of the screen
	nnoremap                n           nzvzz
	nnoremap                N           Nzvzz
	nnoremap                *           *zvzz
	nnoremap                #           #zvzz
	nnoremap                g*          g*zvzz
	nnoremap                g#          g#zvzz

	" hook ups for Ctrl-X, Ctrl-C, Ctrl-V
	vnoremap	<silent>	<C-X>		"+x
	vnoremap	<silent>	<C-C>		"+y
	vnoremap	<silent>	<C-V>		"+gP
	cnoremap	<silent>	<C-V>		<C-R>+
	inoremap				<C-Q>		<C-V>
	if !has("unix")
		set guioptions-=a
	endif

" vim.security {{{1
	set secure
	set noexrc
	set cryptmethod=blowfish2
