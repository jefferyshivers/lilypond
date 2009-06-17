%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "rhythms"

%% Translation of GIT committish: 00e3a8264e138ad61b4f115a173190d5e9dc7533
  texidoces = "
En un compás sencillo como 2/2 ó 4/4, las corcheas se barran de forma
predeterminada como dos grupos de cuatro.

Utilizando un macro que seobreescribe el comportamiento automático del
barrado, este fragmento de código cambia el barrado a pulsos de negra.

"
  doctitlees = "Barras automáticas de dos en dos en los compases de 4/4 o de 2/2"

%% Translation of GIT committish: 1154b407d42f303a024598296ad36ab6c93e2b5a
  texidocfr = "
Dans une métrique simple comme 4/4 ou 2/2, les croches sont ligaturées
par défaut en deux groupes de quatre.

En utilisant une macro qui modifie le comportement des ligatures 
automatiques, voici comment obtenir des ligatures basées sur la valeur 
d'une noire.

"
  doctitlefr = "Ligature automatique deux par deux, aussi bien en 4/4 qu'en 2/2"

  texidoc = "
In a simple time signature of 2/2 or 4/4, 8th notes are beamed by
default as two sets of four.

Using a macro which overrides the autobeaming behavior, this snippet
changes the beaming to quarter note beats. 

"
  doctitle = "Automatic beams two per two in 4/4 or 2/2 time signature"
} % begin verbatim

% Automatic beams two per two in 4/4 or 2/2 time signature
%              _____
% Default     | | | |
%              _   _
% Required    | | | |

% macro for beamed two per two in 2/2 and 4/4 time signature
qBeam = {
  #(override-auto-beam-setting '(end 1 8 * *) 1 4 'Staff)
  #(override-auto-beam-setting '(end 1 8 * *) 2 4 'Staff)
  #(override-auto-beam-setting '(end 1 8 * *) 3 4 'Staff)
}

\score {
  <<
    \new Staff {
      \relative c'' {
        \time 4/4
        g8-"without the macro" g g g g g g g
        g8 g g g4 g8 g g
      }
    }
    %Use the macro
    \new Staff {
      \relative c'' {
        \time 4/4
        \qBeam
        g8-"with the macro" g g g g g g g
        g8 g g g4 g8 g g
      }
    }
  >>
  \layout {
    \context {
      \Staff
      \override TimeSignature #'style = #'()
    }
  }
}

