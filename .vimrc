function! JumpTab()
	if tabpagenr() == 1
		execute "tablast"
	elseif tabpagenr() == tabpagenr('$')
		execute "tabnext"
	else
		execute "tablast"
	endif
endfunction
set modeline
set modelines=5
if has("cscope")
    if filereadable("/usr/local/bin/cscope")
        set csprg=/usr/local/bin/cscope
    elseif filereadable("/usr/bin/cscope")    
        set csprg=/usr/bin/cscope
    else
        echo "warning: can't find cscope"
    endif    
	set csto=0
	set cst
	set nocsverb
    if filereadable("./cscope.out")
        cs add ./cscope.out
    else
        echo "warning: can't find cscope database"
    endif    
	set csverb
endif	

set tags=tags
"ctrlp
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_mruf_max=250
"map <C-m> : CtrlPMRU <CR>
"
"jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"Indent
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
"autocmd VimEnter,Colorscheme * :IndentGuidesToggle
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=darkgrey 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=102
autocmd VimEnter * NERDTree
autocmd VimEnter * :wincmd l

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.svn-base     " Linux/MacOSX

"PowerLine
set nocompatible     "Disable vi-compatibility
set laststatus=2     "Always show the statusline
set encoding=utf-8   "Necessary to show unicode glyphs

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> "查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> "查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> "查找调用本函数的函数
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> " 查找指定的字符串
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> "查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "查找并打开文件，类似vim的find功能
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找包含本文件的文
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> " 查找本函数调用的函数

set cscopetag
set hlsearch
set ts=4
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set nu
set incsearch
set nocp
set foldenable
set ruler                                        " show the cursor position all the time
set smartindent                                  " smart autoindentnig when starting a new line
set wildignore=*.bak,*.o,*.e,*~                  " wildmenu:ignore these extensions
set fdm=indent

"for the fucking encoding
set encoding=utf-8
"set termencoding=utf-8
set fileencodings=utf-bom,utf-8,cp936,gb18030,latin1
language message zh_CN.utf-8
set guifont=Consolas:h12:cANSI

filetype plugin indent on
syntax enable
set t_Co=256
colorscheme lucius
let g:molokai_original=1
let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window   = 1

"let Tlist_Auto_Open=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['^cscope', 'tag.sh']
let NRRDTreeChristmasTree=1
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=30
let g:AutoOpenWinManager=1
let s:licenseTag="Copyright (C) 2011 Tencent Inc.\<enter>"
let s:licenseTag=s:licenseTag."All rights reserved"
let g:mapleader=","
nmap <F8> : TagbarToggle<CR>
nnoremap <silent> <F7> : TlistToggle<CR>
nnoremap <silent> <F6> : NERDTree<CR>
noremap      \a        : A<CR>
inoremap     \a        : A<CR>
map <leader><space> : exec JumpTab()<CR>
"F3 comment
vmap <F3> :s=^\(//\)*=//=g<cr>:noh<cr>
nmap <F3> :s=^\(//\)*=//=g<cr>:noh<cr>
imap <F3> <ESC>:s=^\(//\)*=//=g<cr>:noh<cr>
"F4 uncomment
vmap <F4> :s=^\(//\)*==g<cr>:noh<cr>
nmap <F4> :s=^\(//\)*==g<cr>:noh<cr>
imap <F4> <ESC>:s=^\(//\)*==g<cr>:noh<cr>
"map <F3> :tabprevious<CR>
"map <F4> :tabnext<CR>
map <F5> gg=G 
noremap <F9> <Esc>:syntax sync fromstart<CR>
inoremap <F9> <C-o>:syntax sync fromstart<CR>


"-------------------------------------------------------------------------------
"" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%

let c_syntax_for_h=1
let c_C94=1
let c_C99_warn=1
let c_cpp_warn=1
let c_cpp_comments=1
let c_warn_8bitchars=1
let c_warn_multichar=1
let c_warn_digraph=1
let c_warn_trigraph=1
let c_no_octal=1

let c_comment_strings=1
let c_comment_numbers=1
let c_comment_types=1
let c_comment_date_time=1
" vim -b : edit binary using xxd-format!
augroup Binary
au!
au BufReadPre  *.bin let &bin=1
au BufReadPost *.bin if &bin | %!xxd
au BufReadPost *.bin set ft=xxd | endif
au BufWritePre *.bin if &bin | %!xxd -r
au BufWritePre *.bin endif
au BufWritePost *.bin if &bin | %!xxd
au BufWritePost *.bin set nomod | endif
augroup END

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

