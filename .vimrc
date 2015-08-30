function! UpdateTag()
    cs kill -1
    ! cscope -bq 
    cs add cscope.out
    ! ctags  --c++-kinds=+p --fields=+iaS --extra=+q -R
endfunction
set modeline
set modelines=5
if has("cscope")
    if filereadable("/usr/local/bin/cscope")
        set csprg=/usr/local/bin/cscope
    elseif filereadable("/usr/bin/cscope")    
        set csprg=/usr/bin/cscope
    else
        "echo "warning: can't find cscope"
    endif    
	set csto=0
	set cst
	set nocsverb
    if filereadable("./cscope.out")
        cs add ./cscope.out
    else
        "echo "warning: can't find cscope database"
    endif    
	set csverb
endif	

set tags=tags
set tags+=~/.vim/systags
set backspace=start
"ctrlp
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_mruf_max=250
"map <C-m> : CtrlPMRU <CR>
"
"jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"syntastic 动态语音语法检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["jshint"]

"Indent
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
"autocmd VimEnter,Colorscheme * :IndentGuidesToggle
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=darkgrey 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=102
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
"colorscheme molokai 
"colorscheme zenburn 
colorscheme lucius
let g:molokai_original=1
let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
"let Tlist_Auto_Open=1
let NERDTreeShowBookmarks=1
let NRRDTreeChristmasTree=1
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=30
let g:AutoOpenWinManager=1
let s:licenseTag="Copyright (C) 2011 Tencent Inc.\<enter>"
let s:licenseTag=s:licenseTag."All rights reserved"
let g:mapleader=","
map <F10> :w!<CR>:exec UpdateTag()<CR><CR><CR>
nmap <F8> : TagbarToggle<CR>
nnoremap <silent> <F7> : WMToggle<CR>
nnoremap <silent> <F6> : NERDTree<CR>
noremap      \a        : A<CR>
inoremap     \a        : A<CR>
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
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>


map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>a
map <C-q> :q<cr>
imap <C-q> <ESC>:q<cr>
map <C-S-q> :q!<cr>
imap <C-S-q> <ESC>:q!<cr>
"-------------------------------------------------------------------------------
"" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
""
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


"使用方法：在普通模式下击键zho
function InsertPragmaOnceTag()
let CurTime = strftime("%Y_%m_%d_%H_%M") "将当前时间格式化后存入到CurTime当中去
let CurFilePath = toupper(expand("%")) "expand(/"%/")获取当前编辑的文件路径
let LastSlash = strridx(CurFilePath, "/") "找出路径中最后一个/
let HeadTag1 = "#ifndef "
let HeadTag2 = "#define "
let HeadTag3 = "#endif //"
"将非数字、字母替换为_
let Suffix = substitute(strpart(CurFilePath, LastSlash + 1), "[^a-zA-Z0-9]", "_", "g")."_".CurTime 
let HeadTag1 = HeadTag1.Suffix
let HeadTag2 = HeadTag2.Suffix
let HeadTag3 = HeadTag3.Suffix

"跳转到第一行并输入#ifndef ..
exe "normal ggO".HeadTag1 
exe "normal O".HeadTag2
exe "normal Go".HeadTag3
"添加一个空白行
exe "normal o"
"添加两行空白行并将光标停在第四行
normal 3GO
normal 4GO
endfunction


"添加doxygen风格的文件注释
"使用方法：在普通模式下击键zfc
function InsertFileCommentTag()
let l:File_Path = expand("%")
let l:File_Name = strpart(l:File_Path, strridx(l:File_Path, "/") + 1)
exe "normal ggO/**"
exe "normal o* @file ".l:File_Name
exe "normal o* @brief "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @author hou_jian , houjmail@gmail.com"
exe "normal o* @version 1.0"
exe "normal o* @date ".strftime("%Y/%m/%d-%H:%M:%S")
exe "normal o* @note "
exe "normal o* @remarks Copyright 1998 - 2008 Company Name Inc. All Rights Reserved."
exe "normal o*/"
"重新缩进文件
exe "silent normal gg=G"
"设置光标在@brief后面
:call cursor(l:wRow, l:wCol)
endfunction


"添加doxygen风格的类注释
"使用方法：在普通模式下，将光标停留在类名上面击键zcc
function InsertClassCommentTag()
let Class_Name = expand("<cword>")
exe "normal O/**"
exe "normal o* @class ".Class_Name
exe "normal o* @brief "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @author hou_jian , houjmail@gmail.com" 
exe "normal o* @version 1.0"
exe "normal o* @date ".strftime("%Y/%m/%d-%H:%M:%S")
exe "normal o* @note "
exe "normal o*/"
"exe silent normal gg=G
":call cursor(l:wRow, l:wCol)
endfunction


"添加doxygen风格的函数注释
"使用方法：在普通模式下面，将光标停留在函数名称行击键zmc
function InsertFunctionCommentTag()
exe "normal O/**"
exe "normal o* @brief "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @param "
exe "normal o* @return "
exe "normal o* @note "
exe "normal o*/"
exe "silent normal gg=G"
:call cursor(l:wRow, l:wCol)
endfunction


"添加doxygen风格的结构体注释
"使用方法：在普通模式下，将光标停留在结构体名称上面击键zsc
function InsertStructCommentTag()
let l:Struct_Name = expand("<cword>")
exe "normal O/**"
exe "normal o* @struct ".l:Struct_Name
exe "normal o* @brief "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @note "
exe "normal o*/"
exe "silent normal gg=G"
":call cursor(l:wRow, l:wCol)
endfunction


"添加doxygen风格的枚举体注释
"使用方法：在普通模式下，将光标停留在枚举体名称上面击键zec
function InsertEnumCommentTag()
let l:Enum_Name = expand("<cword>")
exe "normal O/**"
exe "normal o* @enum ".l:Enum_Name
exe "normal o* @brief "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @note "
exe "normal o*/"
exe "silent normal gg=G"
":call cursor(l:wRow, l:wCol)
endfunction


"添加doxygen风格的模块定义注释
"使用方法：在visual模式下选定要加入到模块的行，击键zgc
function InsertGroupCommentTag()
"获取选定的行
let l:wBegin = line("'<")
let l:wEnd = line("'>")
exe "normal ".l:wBegin."G"
exe "normal O/**"
exe "normal o* @defgroup "
let l:wRow = winline()
let l:wCol = wincol()
exe "normal o* @brief "
exe "normal o* @detail "
exe "normal o* @{"
exe "normal o* */"
exe "normal o"
let l:wEnd = l:wEnd + 7 
exe "normal ".l:wEnd."G"
exe "normal o/** @} */ //end define of group" 
":call cursor(l:wRow, l:wCol)
endfunction


"在符号(宏、成员变量、全局变量)后增加doxygen风格的注释
"使用方法：普通模式下，在符号定义行击键zpc
function InsertItemPostCommentTag()
exe "normal A/t"
let l:wRow = winline()
let l:wCol = wincol()
while l:wCol < 60
    exe "normal A/t"
    let l:wCol = wincol()
    endwhile
    exe "normal A/*!< */"
    exe "normal 2h"
    endfunction
    
    
    "在符号(宏、成员变量、全局变量)上方增加doxygen风格的注释或者是函数的简单说明
    "使用方法：在普通模式下，在符号定义行击键zuc
    function InsertItemUpCommentTag()
    exe "normal O"
    exe "normal o/// "
    endfunction
    nmap zho <Esc>:call InsertPragmaOnceTag()<CR>i
    nmap zfc <Esc>:call InsertFileCommentTag()<CR>i
    nmap zcc <Esc>:call InsertClassCommentTag()<CR>i
    nmap zmc <Esc>:call InsertFunctionCommentTag()<CR>i
    nmap zsc <Esc>:call InsertStructCommentTag()<CR>i
    nmap zec <Esc>:call InsertEnumCommentTag()<CR>i
    nmap zpc <Esc>:call InsertItemPostCommentTag()<CR>i
    nmap zuc <Esc>:call InsertItemUpCommentTag()<CR>i
    vmap zgc <Esc>:call InsertGroupCommentTag()<CR>i 

    



    
