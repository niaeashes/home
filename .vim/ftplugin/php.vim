:set tabstop=4
:set shiftwidth=4
:set noexpandtab
:set autoindent

"------ Syntax Check ------
" PHP Lint
if exists('*g:PHPLint')
	autocmd BufWritePost *.php :call PHPLint()
	function PHPLint()
		let result = system( &ft . ' -l ' . bufname(""))
		let headPart = strpart(result, 0, 16)
		if headPart != "No syntax errors"
			echo result
		endif
	endfunction
endif
