%%  Do not edit this file; it is auto-generated from LSR!
\version "2.11.23"

\header { texidoc = "
By inserting the markup command @code{\postscript}, you can insert
PostScript directly into the output.

  

" }

\score {
   \relative c'' {
    a-\markup { \postscript #"3 4 moveto 5 3 rlineto stroke" }
     -\markup { \postscript #"[ 0 1 ] 0 setdash 3 5 moveto 5 -3 rlineto stroke " }
    
    b-\markup { \postscript #"3 4 moveto 0 0 1 2 8 4 20 3.5 rcurveto stroke" }
    s2
    a'1
  }
  \layout { linewidth = 70 * 5 \pt }
}


