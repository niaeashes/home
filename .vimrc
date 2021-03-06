syntax on
filetype plugin on
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set number
set autoindent
set modeline
set modelines=5
set hidden

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'posva/vim-vue'

call vundle#end()

filetype plugin indent on

nmap <Space>n :next<CR>
nmap <Space>b :prev<CR>
nmap <Space>l :list<CR>
nmap <Space>] <C-w><Right><CR>
nmap <Space>[ <C-w><Left><CR>
nmap <Space>; :vsplit<CR>
nmap <Space>f :files<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

if filereadable(".vimrc") && get(g:, 'optional_source', 1)
	:let g:optional_source=0
	source .vimrc
endif

autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.less set ft=css
autocmd BufNewFile,BufRead *.jbuilder set ft=ruby
autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType swift setlocal ts=4 sts=4 sw=4 expandtab
