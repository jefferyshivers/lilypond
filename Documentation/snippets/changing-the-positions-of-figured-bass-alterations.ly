%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.39"

\header {
  lsrtags = "chords"

%% Translation of GIT committish: a874fda3641c9e02f61be5c41b215b8304b8ed00
  texidoces = "
Las alteraciones y los signos «más» pueden aparecer antes o
después de los números, según el valor de las propiedades
@code{figuredBassAlterationDirection} y
@code{figuredBassPlusDirection}.

"
  doctitlees = "Cambiar las posiciones de las alteraciones del bajo cifrado"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Versetzungszeichen und Pluszeichen können vor oder nach den Ziffern erscheinen,
je nach den Einstellungen der @code{figuredBassAlterationDirection} und
@code{figuredBassPlusDirection}-Eigenschaften.

"
  doctitlede = "Positionen von Generalbass-Alterationszeichen verändern"

  texidoc = "
Accidentals and plus signs can appear before or after the numbers,
depending on the @code{figuredBassAlterationDirection} and
@code{figuredBassPlusDirection} properties.

"
  doctitle = "Changing the positions of figured bass alterations"
} % begin verbatim

\figures {
  <6\+> <5+> <6 4-> r
  \set figuredBassAlterationDirection = #RIGHT
  <6\+> <5+> <6 4-> r
  \set figuredBassPlusDirection = #RIGHT
  <6\+> <5+> <6 4-> r
  \set figuredBassAlterationDirection = #LEFT
  <6\+> <5+> <6 4-> r
}

