call plug#begin()
Plug 'junegunn/fzf', #{ dir: '~/.fzf', do: './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'jdelkins/vim-correction'
Plug 'machakann/vim-swap'
Plug 'ap/vim-css-color', #{ as: 'css-color' }

Plug 'mhinz/vim-signify'
Plug 'dietsche/vim-lastplace'

Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'
Plug 'vim-airline/vim-airline'
Plug 'junkblocker/vim-indent-guides'

Plug 'ycm-core/YouCompleteMe', #{ do: './install.py' }
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'preservim/nerdtree', #{ on: 'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'vim-scripts/LargeFile'
Plug 'godlygeek/tabular'

Plug 'geoffharcourt/one-dark.vim'
Plug 'edentsai/extended-molokai'
Plug 'morhetz/gruvbox'
Plug 'python-mode/python-mode', #{ for: 'python', branch: 'develop' }

Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
call plug#end()

let g:airline_powerline_fonts = 1

let g:SuperTabDefaultCompletionType = '<C-n>'

let g:pymode_breakpoint              = 1
let g:pymode_folding                 = 0
let g:pymode_indent                  = 1
let g:pymode_lint                    = 1
let g:pymode_lint_cwindow            = 1
let g:pymode_lint_ignore             = ['E221', 'E501']  " spaces before operators, line length
let g:pymode_lint_on_write           = 1
let g:pymode_lint_signs              = 1
let g:pymode_motion                  = 1
let g:pymode_python                  = 'python3'
let g:pymode_rope                    = 0
let g:pymode_rope_auto_project       = 0
let g:pymode_rope_complete_on_dot    = 0
let g:pymode_rope_completion         = 0
let g:pymode_rope_lookup_project     = 0
let g:pymode_syntax                  = 1
let g:pymode_syntax_all              = 1
let g:pymode_virtualenv              = 0

let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = vimrc#make_vimfiles_dir('UltiSnips')

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=3
let g:indent_guides_exclude_filetypes = ['help', 'startify']
if !has('gui_running') && &termguicolors == 0
	let g:indent_guides_auto_colors=0
	function! s:indent_set_console_colors()
		hi IndentGuidesOdd ctermbg=235 ctermfg=237
		hi IndentGuidesEven ctermbg=236 ctermfg=237
	endfunction
	autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
endif

let g:ycm_add_preview_to_completeopt               = 0
let g:ycm_collect_identifiers_from_tags_files      = 1
let g:ycm_filepath_completion_use_working_dir      = 1
let g:ycm_log_level                                = 'warning'
let g:ycm_seed_identifiers_with_syntax             = 1

let g:ycm_error_symbol                             = ''
let g:ycm_warning_symbol                           = ''

let g:ycm_add_preview_to_completeopt               = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_key_list_previous_completion             = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion               = ['<C-n>', '<Down>']
" let g:ycm_key_list_stop_completion                 = ['<C-y>', '<CR>']

let g:ycm_server_python_interpreter                = 'python3'
let g:ycm_enable_semantic_highlighting             = 1
let g:molokai_transparent                          = 1

" let s:highgroups = {
" 			\   'typeParameter': 'PreProc',
" 			\   'parameter': 'Normal',
" 			\   'variable': 'Normal',
" 			\   'property': 'Normal',
" 			\   'enumMember': 'Normal',
" 			\   'event': 'Special',
" 			\   'member': 'Normal',
" 			\   'method': 'Normal',
" 			\   'class': 'Special',
" 			\   'namespace': 'Special',
" 			\ }
"
" for tokenType in keys(s:highgroups)
" 	call prop_type_add('YCM_HL_' . tokenType, {'highlight': s:highgroups[tokenType]})
" endfor

let g:ycm_language_server = []
