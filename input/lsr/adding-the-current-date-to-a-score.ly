%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "text, titles"

%% Translation of GIT committish: 00e3a8264e138ad61b4f115a173190d5e9dc7533
  texidoces = "
Con algo de código de Scheme, se puede añadir fácilmente la fecha
actual a una partitura.
"
  doctitlees = "Añadir la fecha actual a una partitura"
  
%% Translation of GIT committish: 7eb450e8e6c935410b8f3212cb53e5a731f4f33f
  texidocfr = "
Avec un peu de code Scheme, voici comment ajouter facilement
la date du jour à votre partition.
"
  
  doctitlefr = "Ajout de la date du jour à une partition"

  texidoc = "
With a little Scheme code, the current date can easily be added to a
score.

"
  doctitle = "Adding the current date to a score"
} % begin verbatim

% first, define a variable to hold the formatted date:
date = #(strftime "%d-%m-%Y" (localtime (current-time)))

% use it in the title block:
\header {
  title = "Including the date!"
  subtitle = \date
}

\score {
  \relative c'' {
    c4 c c c
  }
}
% and use it in a \markup block:
\markup {
  \date
}

