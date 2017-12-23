" Show whitespace and EOL characters
set list
"
" Show line numbers
" set nu
" Hide Line Numbers
" set nonu
"
" Show matching brackets
set showmatch
"
" Show current mode in status line
set showmode
"
" Set TAB width
set tabstop=4
"
" Define the point at which lines wrap in vanilla mode
set wrapmargin=10
"
" --------------------------
"
" control-b - backward character ala emacs
map  h
" control-f - forward character ala emacs
map  l
" control-t - twiddle chars ala emacs
map  hxpl
" F2 - invoke ispell
map #2 :w:!ispell -x %:e!
" F5 - invoke fmt
"map #5 !}fmt
"
" Classic vi user community macros for completion 
" based on previous or next instances of a word
" in the current buffer that matches the current 
" substring
"
map!  a. hbmmi?\<2h"zdt.@zywmx`mP xi
map!  a. hbmmi/\<2h"zdt.@zywmx`mP xi
"
" --------------------------
"
" Abbreviations
"
ab het the
ab teh the
"
" --------------------------
"
