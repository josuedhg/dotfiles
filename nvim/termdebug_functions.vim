function! GDBCommand(...)
  if !exists(":Over")
    return
  endif
  let param = ''
  for val in a:000
    let param = param . ' ' . val
  endfor
  call TermDebugSendCommand(param)
endfunc

function! GDBMemory(...)
  if !exists(':Over')
    return
  endif
  let param = 'x'
  if a:0 > 2
    let param = param . '/' . a:1 . ' ' . a:2
  else
    let param = param . ' ' . a:1
  endif
  call TermDebugSendCommand(param)
endfunc

