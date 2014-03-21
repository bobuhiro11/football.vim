" Vim global plugin for creating football formation template.

if exists("g:loaded_football")
  finish
endif
let g:loaded_football = 1

function g:mystrlen(str)
  let l:str = split(a:str, '.\zs')
  let l:n = 0
  for c in l:str
      let l:n = l:n + (strlen(c) > 1 ? 2 : 1)
  endfor
  return l:n
endfunction

" store cpoptions for '\'
let s:save_cpo = &cpo
set cpo&vim

function s:Create()
  let l:firstline = search('@'.'football.vim')
  let l:form = str2nr(getline(l:firstline)[:2])

  if l:form == "442"

    let l:nfw = l:form / 100
    let l:nmf = (l:form / 10) % 10
    let l:ndf = l:form % 10

    let l:fw = s:trimlist(split(getline(l:firstline + 1)[3:],"("))
    let l:mf = s:trimlist(split(getline(l:firstline + 2)[3:],"("))
    let l:df = s:trimlist(split(getline(l:firstline + 3)[3:],"("))
    let l:gk = s:trimlist(split(getline(l:firstline + 4)[3:],"("))

    exe ':normal '.(l:firstline+5).'gg'
    call s:myexpand442(l:fw, l:mf, l:df, l:gk)

  endif
endfunction

function s:trimlist(list)
  let l:rc = []
  for k in a:list
    call add(l:rc, k[:-3])
  endfor
  return l:rc
endfunction

function s:myexpand442(f,m,d,g)
  exe ':normal o|----------------------------------------------------|'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|                 *                *                 |'
  exe ':normal o|               '.s:f(a:f[0]).'  '.s:f(a:f[1]).'     |'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|            *                         *             |'
  exe ':normal o|          '.s:f(a:m[0]).'           '.s:f(a:m[3]).' |'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|                 *                *                 |'
  exe ':normal o|               '.s:f(a:m[1]).'  '.s:f(a:m[2]).'     |'
  exe ':normal o|----------------------------------------------------|'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|            *                         *             |'
  exe ':normal o|          '.s:f(a:d[0]).'           '.s:f(a:d[3]).' |'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|                 *                *                 |'
  exe ':normal o|               '.s:f(a:d[1]).'  '.s:f(a:d[2]).'     |'
  exe ':normal o|                                                    |'
  exe ':normal o|                                                    |'
  exe ':normal o|                          *                         |'
  exe ':normal o|                      '.s:f(a:g[0]).'               |'
  exe ':normal o|----------------------------------------------------|'
endfunction

function s:f(string)
  let l:len = g:mystrlen(a:string)
  let l:len = 15 - l:len
  let l:rc = a:string

  for i in range(1, l:len)
    let l:rc = l:rc.' '
  endfor
  return l:rc
endfunction

function s:Prepare(p)
  echo 's:Prepare('. a:p . ') called in footbal.vim and'
  if a:p == 442
    exe ':normal o442@'.'football.vim'
    exe ':normal oFW () () '
    exe ':normal oMF () () () () '
    exe ':normal oDF () () () () '
    exe ':normal oGK () '
  endif
endfunction

if !exists(":FootballPrepare")
  command -nargs=1  FootballPrepare  call s:Prepare(<q-args>)
endif

if !exists(":FootballCreate")
  command FootballCreate  call s:Create()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
