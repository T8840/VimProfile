""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"python自动补全插件"
Plug 'davidhalter/jedi-vim'
"python缩进指示线插件"
Plug 'Yggdroot/indentLine'
"Python代码自动格式化插件autopep8"
Plug 'tell-k/vim-autopep8'
"Python语法和格式检测"
Plug 'nvie/vim-flake8'


" 结束 "
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
				 "实用设置"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                "自动语法高亮"
winpos 5 5               "设定窗口大小"
set nu                   "显示行号"
set background="dark"    "背景使用黑色"
colorscheme murphy       "设置配色方案"
set go=                  "不要图形按钮"
set ruler                "显示标尺"
set showcmd              "输入的命令显示出来"
set cmdheight=1          "命令行（在状态行下）的高度，设置为1"
set confirm              "在处理未保存或只读文件的时候，弹出确认"
set autoindent           "自动缩进"
set autoread 	         "设置当文件被改动时自动载入"
set cindent

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
noremap jj <ESC> "将ESC映射为两次j键"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
				 "编辑python脚本"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call PRUN()<CR>
func! PRUN()
	exec "w" 
	        if &filetype == 'python'
			exec "!python %"
		endif
endfunc

