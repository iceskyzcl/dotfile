"======vim-plug======
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'         "操作符gc 见`:h commentary`
Plug 'tpope/vim-surround'           "操作符ys/ds/cs, 见`:h surround`
Plug 'yianwillis/vimcdoc'           "VIM中文文档
call plug#end()

" vim-plug help
" :PlugInstall [name ...]           - Install plugins
" :PlugUpdate [name ...]            - Install or update plugins
" :PlugClean                        - Remove unused directories
" :PlugUpgrade                      - Upgrade vim-plug itself
" :PlugStatus                       - Check the status of plugins
" :PlugDiff                     - Review changes after update, press X to revert
" :PlugSnapshot[!] [output path]    - Generate script for restoring plugins


"======MY VIM CONFIGURE======
set encoding=utf-8                  "使用utf-8编码
set fileformat=unix                 "使用unxi换行符
set clipboard=unnamed               "使用系统剪切板
set autoread                        "外部修改文件后自动重载
set autowrite                       "在:next, :make 命令之前自动保存
autocmd BufWritePre * :%s/\s\+$//e  "保存时自动删除行尾空格或Tab

set number                          "显示行号
set ruler                           "状态栏显示光标坐标
set showcmd                         "状态栏显示命令
set wildmode=longest,list,full      "命令行模式补全次序
set wildmenu                        "wildmode=full时显示补全选项

set incsearch                       "随着键入自动查找
set hlsearch                        "高亮匹配项
set ignorecase                      "搜索时忽略大小写
set smartcase                       "输入大写字母时仍大小写敏感

set textwidth=79                    "单行超过79个字符自动换行
set autoindent                      "自动缩进
set smartindent                     "智能缩进{}
set expandtab                       "用空格代替tab
set tabstop=4                       "tab显示长度
set softtabstop=4                   "编辑时tab和退格长度
set shiftwidth=4                    "缩进长度
"html, css, js 缩进2格
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

set foldmethod=indent               "光标在缩进下方时用za命令折叠或展开代码
set foldlevel=99                    "默认展开


"======NERDTree======
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']


"======YouCompleteMe======
"识别Python环境
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.ycm_vimrc.py'