%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "rhythms"

%% Translation of GIT committish: 5a33019d8b4a837f564eadd4979501ff07e9dfd5
  texidoces = "

Al establecer la propiedad @code{'strict-grace-spacing} hacemos
que las columnas musicales para las notas de adorno sean
'flotantes', es decir, desacopladas de las notas que no son de
adorno: primero se aplica el espaciado de las notas normales, y
luego se ponen las columnas musicales de las notas de adorno a la
izquierda de las columnas musicales de las notas principales.

"

  doctitlees = "Posicionamiento de las notas de adorno con espacio flotante"


%% Translation of GIT committish: 13ac9d1dfbcc297166948ee396e9ade078d2446e
  texidocde = "
Wenn man die Eigenschaft @code{'strict-grace-spacing} aktiviert,
werden die Verzierungsnoten \"fließend\" gemacht, d.h. sie sind
von den normalen Noten los gekoppelt: Zuerst werden die normalen
Noten platziert, dann erst die Verzierungen links von der
Hauptnote gesetzt.

"
  doctitlede = "Positionierung von Verzierungen mit verschiebbarem Platz"

  texidoc = "
Setting the property @code{'strict-grace-spacing} makes the musical
columns for grace notes 'floating', i.e., decoupled from the non-grace
notes: first the normal notes are spaced, then the (musical columns of
the) graces are put left of the musical columns for the main notes.

"
  doctitle = "Positioning grace notes with floating space"
} % begin verbatim

\relative c'' {
  <<
    \override Score.SpacingSpanner #'strict-grace-spacing = ##t
    \new Staff \new Voice {
      \afterGrace c4 { c16[ c8 c16] }
      c8[ \grace { b16[ d] } c8]
      c4 r
    }
    \new Staff {
      c16 c c c c c c c c4 r
    }
  >>
}

