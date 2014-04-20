syntax on
filetype plugin on
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set number
set autoindent
set modeline
set modelines=5
set hidden

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
