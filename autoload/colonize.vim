" colonize#rename({name}, {rename}[, {mode}])
"
" This will move the mapping for {name} to {rename} (in {mode}). {name} is
" either the 'lhs' of the mapping to move or the result of a call to
" maparg(..., dict = 1). {rename} is the name or 'lhs' of the mapping to
" create.
"
" {mode} is a 'mode' argument to maparg(). If {name} is the result of a call
" to maparg(..., dict = 1), its 'mode' is ignored; in this case {mode} must be
" the same 'mode' that was passed to maparg().
function! colonize#rename(name, rename, mode) abort
  if type(a:name) == type({})
    let maparg_dict = a:name
  else
    let maparg_dict = maparg(a:name, a:mode, 0, 1)
  endif

  if empty(maparg_dict) | return | endif

  let mapcommand = a:mode . (maparg_dict.noremap ? 'nore' : '') . 'map'
  for item in ['buffer', 'nowait', 'silent', 'expr']
    if maparg_dict[item] | let mapcommand .= ' <' . item . '>' | endif
  endfor

  " We can't call maparg(..., dict = 0) here to have it handle <SID> because
  " it will also expand <Bar>.
  execute mapcommand . ' ' . a:rename . ' ' . substitute(
        \ maparg_dict.rhs, '<SID>', '<SNR>' . maparg_dict.sid . '_', 'g')

  " The only modifier that's relevant to unmap is <buffer>
  let unmcommand = a:mode . 'unmap'
  if maparg_dict.buffer
    let unmcommand .= ' <buffer>'
  endif
  execute unmcommand . ' ' . maparg_dict.lhs
endfunction

" vim-fugitive

function! colonize#fugitive(filetype) abort
  if !has_key(b:, 'fugitive_type') | return | endif
  if !get(maparg('<CR>', 'n', 0, 1), 'buffer', 0) | return | endif
  call colonize#rename('<CR>', 'g<CR>', 'n')
endfunction
