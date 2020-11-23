" Author:  Bjorn Winckler
" Version: 0.0
" License: (c) 2014 Bjorn Winckler.  Licensed under the same terms as Vim.
"
" Summary:
"
" Tools for processing FASTA files.
"

if exists("g:loaded_fasta") || &cp || v:version < 700 | finish | endif
let g:loaded_fasta = 1


" Supports IUPAC-IUB codes (nb. S, W, N are their own complement)
function! FastaComplement()
    call setline(".", tr(getline("."), "GATCRYMKHBVDgatcrymkhbvd", "CTAGYRKMDVBHctagyrkmdvbh"))
endfunction

function! FastaReverse()
    call setline(".", join(reverse(split(getline("."), '\zs')),""))
endfunction

function! FastaReverseComplement()
    call FastaReverse()
    call FastaComplement()
endfunction

function! FastaRegex(iupac)
    let saveic=&ic
    set noignorecase

    let p = substitute(substitute(a:iupac, "r", '[ga]', "g"), "R", '[GA]', "g")
    let p = substitute(substitute(p, "y", '[tc]', "g"), "Y", '[TC]', "g")
    let p = substitute(substitute(p, "m", '[ac]', "g"), "M", '[AC]', "g")
    let p = substitute(substitute(p, "k", '[gt]', "g"), "K", '[GT]', "g")
    let p = substitute(substitute(p, "s", '[gc]', "g"), "S", '[GC]', "g")
    let p = substitute(substitute(p, "w", '[at]', "g"), "W", '[AT]', "g")
    let p = substitute(substitute(p, "h", '[act]', "g"), "H", '[ACT]', "g")
    let p = substitute(substitute(p, "b", '[gtc]', "g"), "B", '[GTC]', "g")
    let p = substitute(substitute(p, "v", '[gca]', "g"), "V", '[GCA]', "g")
    let p = substitute(substitute(p, "d", '[gat]', "g"), "D", '[GAT]', "g")
    let p = substitute(substitute(p, "n", '[gatc]', "g"), "N", '[GATC]', "g")

    let &ic=saveic
    return p
endfunction

function! FastaSingleLine()
    :g/^>/s/\n/\r\r/g
    :%s/\n\(^[^>]\+\)/\1/g
endfunction

command! -range FastaReverseComplement
            \ :<line1>,<line2>call FastaReverseComplement()

command! -nargs=1 FastaSearch :let @/=FastaRegex(<args>) | norm n

command! FastaSingleLine  call FastaSingleLine() 
