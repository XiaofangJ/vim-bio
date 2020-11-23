if exists("syntax_on")
	syntax reset
	colorscheme bioSyntax
	set nowrap
endif

" In the future, implement 'context-aware' fasta
" in which Nucleotides vs. Amino Acid sequences are detected
" and colored accordingly

syntax match headerbw ">.*$"
syntax match aaA "[Aa]"
syntax match aaR "[Rr]"
syntax match aaN "[Nn]"
syntax match aaD "[Dd]"
syntax match aaC "[Cc]"
syntax match aaQ "[Qq]"
syntax match aaE "[Ee]"
syntax match aaG "[Gg]"
syntax match aaH "[Hh]"
syntax match aaI "[Ii]"
syntax match aaL "[Ll]"
syntax match aaK "[Kk]"
syntax match aaM "[Mm]"
syntax match aaF "[Ff]"
syntax match aaP "[Pp]"
syntax match aaS "[Ss]"
syntax match aaT "[Tt]"
syntax match aaW "[Ww]"
syntax match aaY "[Yy]"
syntax match aaV "[Vv]"
syntax match aaB "[Bb]"
syntax match aaX "[Xx]"
syntax match aaZ "[Zz]"
syntax match ntGap "[/\-/\.]" 
