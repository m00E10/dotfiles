" Vim syntax file, Adds color to your plaintext notes :-)
"
" Preview: https://i.imgur.com/YA3FuAD.png
" Language: notes
" Maintainer: m00trix
" https://vimhelp.org/syntax.txt.html#%3Asyn-files
"
"
" TO INSTALL
" Place ME in ~/.vim/syntax/notes.vim
" echo 'au BufRead,BufNewFile *.notes set filetype=notes' >> ~/.vimrc
" echo 'au BufWinLeave * mkview' >> ~/.vimrc
" echo 'au BufWinEnter * silent loadview' >> ~/.vimrc
"
"
" To use, just make a text file that ends in .notes
"
" Intended usage is as follows:
" ==[ ]=========| RED, Main section
"
" Text
" Text
"
"
" >> >>>>>>>>>>>| ORANGE, Subsection
"
"  Text
"  Text
"
" -- -----------|  BLUE, A large idea, may be composed of smaller ideas
"   Text
"   Text
"
"   :: ::          PINK, A smaller idea
"    Text
"    Text
"
"
" # Meta comments for notes like # should expand later, also useful for links
" *underline* Underline support for keywords/terms/more important stuff
" > Orange, Bullet point
" !!  YELLOW  White on Red BG Text, !! SUPER IMPORTANT IDEA !!
" ??  PURPLE  Black on Purple BG Text, ?? A question I want to answer later ??
" 
" Subsections can be vim folded, and then mainsections can have their folded
" subsections ALSO folded. Makes it easy to navigate 1000+ line plaintext
" notes

if exists("b:current_syntax")
  finish
endif

syn match chapter "=="
syn match chapter "\["
syn match chapter "\]"
syn match chapter "=|"
syn match chapter "==|"
syn match chapter "("
syn match chapter ")"
syn match chapter "->"

syn match section "|"
syn match section "-|"
syn match section "--"

syn match bullet ">>"
syn match bullet ">|"
syn match bullet ">>|"

syn match idea "::"
syn region idea start="+++" end="+++"
syn region underline start="*" end="*"
syn region important start="!!" end="!!"
syn region qestion start="??" end="??"
syn region misc start="///" end="\\\\\\"
syn match misc " > "
syn match comment "# .*$"

let b:current_syntax = "notes"

hi def link chapter WarningMsg
hi def link section EndOfBuffer
hi def link underline CursorLine
hi def link comment Keyword
hi def link important Error
hi def link misc Question
hi def link qestion Pmenu
hi def link idea Title
hi def link bullet Keyword
