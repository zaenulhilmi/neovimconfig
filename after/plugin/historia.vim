function! HistoriaToggle() 
    if len(g:values) <= 1 
       echo "empty history" 
    else
        let revValues = reverse(copy(g:values))
        if len(revValues) >=2 
            let first = revValues[:1]
            call reverse(first)
            let second = revValues[2:]
            let revValues = first + second
        endif

        let revValues = revValues[:10]
        call popup_menu#open(revValues, {selected -> OpenFile(selected)},
        \ {
		\ 	'relative': 'editor',
		\ 	'col': 10,
		\ 	'row': 10,
		\ 	'border': 'double'
		\ })
    endif
endfunction


augroup enter
    autocmd!
    autocmd BufEnter * :call Push()
augroup END

function! OpenFile(fileName)
        exec 'e ' . g:dict[a:fileName]
endfunction


let g:values = []
let g:dict = {}
function! Push()
    let bufferName = bufname("%")
    let bufferLocation = expand("%:p")
    if bufferName == "" || bufferName[:6] == 'term://'
        return
    endif

    call add(g:values, bufferName)
    let g:values =filter(copy(g:values), 'index(g:values, v:val, v:key+1)==-1')
    let g:dict[bufferName] = bufferLocation
endfunction


