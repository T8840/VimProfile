                                 "使用vim-plug插件"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开始：定义插件存放位置 "
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }     " 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载 
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }    " 确定插件仓库中的分支或者 tag 
Plug 'tpope/vim-fugitive'                                  " vim内集成Git 
Plug 'vim-airline/vim-airline'                              " 下方显示指示箭头 
Plug 'preservim/nerdcommenter'                              " 代码注释插件
Plug 'jiangmiao/auto-pairs'                                 " 括号/引号自动补齐插件
Plug 'kien/rainbow_parentheses.vim'                         " 多色彩括号显示插件 

"---------Markdown插件---------
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"---------Python插件-----------
"python自动补全插件"
Plug 'davidhalter/jedi-vim'
"python缩进指示线插件"
Plug 'Yggdroot/indentLine'
"Python代码自动格式化插件autopep8"
Plug 'tell-k/vim-autopep8'
"Python语法和格式检测"
Plug 'nvie/vim-flake8'

"---------Java插件-------------
"

" 结束 "
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
				 "实用设置"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                "自动语法高亮"
winpos 5 5               "设定窗口大小"
set nu                   "显示行号"
set relativenumber       "显示光标所在的当前行的行号，其他行为相对于该行的行号"
set background="dark"    "背景使用黑色"
colorscheme murphy       "设置配色方案"
set go=                  "不要图形按钮"
set ruler                "显示标尺"
set showcmd              "输入的命令显示出来"
set showmode             "在底部显示是命令模式还是插入模式"
set cmdheight=1          "命令行（在状态行下）的高度，设置为1"
set confirm              "在处理未保存或只读文件的时候，弹出确认"
set autoindent           "自动缩进"
set autoread 	         "设置当文件被改动时自动载入"
filetype indent on       "开启文件类型检查，并且载入于该类型对应的缩进规则" 
set cindent
set encoding=utf-8       "使用utf-8编码"
set mouse=a                   "启用鼠标"
set selection=exclusive       
set selectmode=mouse,key
set matchtime=5
set incsearch
set hlsearch                  "高亮搜索项"
set cursorline                "突出显示当前行"
set cursorcolumn              "突出显示当前列"
set completeopt=preview,menu  "代码补全"
filetype plugin on            "允许插件"
set clipboard+=unnamed        "共享剪切板"
"set history=1000"            "历史记录数"
set nobackup                  "禁止生成临时文件"
set ignorecase                "搜索忽略大小写"
set nocompatible "是否兼容VI,no为不完全兼容"
filetype on 





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                 "键盘命令"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开vim自动执行命令
" autocmd VimEnter * NERDTree
" 切换窗口命令映射-符合hjkl习惯
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-L> <C-W><C-L>
" 插入模式下移动
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>
inoremap <M-n> <Down>
inoremap <M-p> <Up>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
				 "编辑python脚本"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py exec ":call SetPythonTitle()"
	func SetPythonTitle()
		call setline(1,"#!/usr/bin/env python")
		call append(line("."),"# -*- coding: utf-8 -*- ")
		call append(line(".")+1,"# ")
		call append(line(".")+2,"#  FileName     : ".expand("%:t"))
		call append(line(".")+3,"#  Date         : ".strftime("%Y年%m月%d日"))
		call append(line(".")+4,"#  Description  : ")
		call append(line(".")+5,"# ")
	endfunc
"自动将光标定位到末尾"
map <F5> :call PRUN()<CR>
func! PRUN()
	exec "w" 
	        if &filetype == 'python'
			exec "!python3 %"
		endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
				 "编辑C/C++脚本"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp exec ":call SetCTitle()"
	func SetCTitle()
		call setline(1,"/**")
		call append(line(".")," *  Copyright (C) ".strftime("%Y")." All rights reserved.")
		call append(line(".")+1," * ")
		call append(line(".")+2," *  FileName     : ".expand("%:t"))
		call append(line(".")+3," *  Author       : Atao")
		call append(line(".")+4," *  Email        : Atao@123.com")
		call append(line(".")+5," *  Date         : ".strftime("%Y年%m月%d日"))
		call append(line(".")+6," *  Description  : ")
		call append(line(".")+7," */")
	endfunc
"自动将光标定位到末尾"
autocmd BufNewFile * normal G

