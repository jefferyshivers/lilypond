%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "staff-notation, contexts-and-engravers"

%% Translation of GIT committish: f39a9724d9f51ed9d0d464689ef62f549d7b8dd6
  texidoces = "
Se puede usar el delimitador de comienzo de un sistema
@code{SystemStartSquare} estableciéndolo explícitamente dentro de
un contexto @code{StaffGroup} o @code{ChoirStaffGroup}.

"
  doctitlees = "Uso del corchete recto al comienzo de un grupo de pentagramas"

%% Translation of GIT committish: 0364058d18eb91836302a567c18289209d6e9706
  texidocde = "
Die Klammer zu Beginn von Systemgruppen kann auch in eine eckige Klammer
(@code{SystemStartSquare}) umgewandelt werden, wenn man sie explizit
im @code{StaffGroup}- oder @code{ChoirStaffGroup}-Kontext setzt.

"
  doctitlede = "Eine eckige Klammer zu Beginn von Systemgruppen benutzen"

  texidoc = "
The system start delimiter @code{SystemStartSquare} can be used by
setting it explicitly in a @code{StaffGroup} or @code{ChoirStaffGroup}
context. 

"
  doctitle = "Use square bracket at the start of a staff group"
} % begin verbatim

\score {
  \new StaffGroup { << 
  \set StaffGroup.systemStartDelimiter = #'SystemStartSquare
    \new Staff { c'4 d' e' f' }
    \new Staff { c'4 d' e' f' }
  >> }
}

