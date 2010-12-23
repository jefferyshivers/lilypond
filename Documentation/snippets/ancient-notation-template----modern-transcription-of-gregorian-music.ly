%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.39"

\header {
  lsrtags = "vocal-music, ancient-notation, template"

%% Translation of GIT committish: a874fda3641c9e02f61be5c41b215b8304b8ed00
  texidoces = "
Este ejemplo muestra cómo hacer una transcripción moderna de canto
gregoriano. El canto gregoriano no tiene compás ni plicas; utiliza
solamente cabezas de nota de blanca y de negra, y unas marcas
especiales que indican silencios de distintas longitudes.

"

  doctitlees = "Plantilla para notación de música antigua (transcripción moderna de canto gregoriano)"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40

  texidocde = "
Dieses Beispiel zeigt eine moderne Transkription des Gregorianischen
Chorals. Hier gibt es keine Takte, keine Notenhälse und es werden nur
halbe und Viertelnoten verwendet. Zusätzliche Zeichen zeigen die
Länge von Pausen an.
"

 doctitlede = "Vorlage für Alte Notation -- moderne Transkription des gregorianischen Chorals"

%% Translation of GIT committish: bdfe3dc8175a2d7e9ea0800b5b04cfb68fe58a7a
  texidocfr = "
Voici comment vous pourriez transcrire du grégorien.  Pour mémoire, il
n'y a en grégorien ni de découpage en mesure, ni de hampe ; seules
sont utilisées des têtes de note blanches ou noires, ainsi que des
signes spécifiques permettant d'indiquer des silences de différentes durées.

"
  doctitlefr = "Exemples de notation ancienne -- transcription moderne de musique grégorienne"

  texidoc = "
This example demonstrates how to do modern transcription of Gregorian
music. Gregorian music has no measure, no stems; it uses only half and
quarter note heads, and special marks, indicating rests of different
length.

"
  doctitle = "Ancient notation template -- modern transcription of gregorian music"
} % begin verbatim

\include "gregorian.ly"

chant = \relative c' {
  \set Score.timing = ##f
  f4 a2 \divisioMinima
  g4 b a2 f2 \divisioMaior
  g4( f) f( g) a2 \finalis
}

verba = \lyricmode {
  Lo -- rem ip -- sum do -- lor sit a -- met
}

\score {
  \new Staff <<
    \new Voice = "melody" \chant
    \new Lyrics = "one" \lyricsto melody \verba
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
      \remove "Bar_engraver"
      \override Stem #'transparent = ##t
    }
    \context {
      \Voice
      \override Stem #'length = #0
    }
    \context {
      \Score
      barAlways = ##t
    }
  }
}

