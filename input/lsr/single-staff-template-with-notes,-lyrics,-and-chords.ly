%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "vocal-music, chords, template"

%% Translation of GIT committish: 7e2910d2bc6167b10cfe328eb17a5f710f2a515a
  texidoces = "
Esta plantilla facilita la preparación de una canción con melodía,
letra y acordes.

"
  doctitlees = "Plantilla de pentagrama único con música, letra y acordes"
  
%% Translation of GIT committish: 17633f6b8681af86230aa84597fe7561e98c91d6
  texidocde = "
Mit diesem Beispiel können Sie einen Song mit Melodie, 
Text und Akkorden schreiben.
"

%% Translation of GIT committish: 06d99c3c9ad1c3472277b4eafd7761c4aadb84ae
  texidocja = "
これは旋律、単語、コードを持つ歌曲の楽譜のためのテンプレートです。
"

  texidoc = "
This template allows the preparation of a song with melody, words, and
chords. 

"
  doctitle = "Single staff template with notes, lyrics, and chords"
} % begin verbatim

melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4
  
  a4 b c d
}

text = \lyricmode {
  Aaa Bee Cee Dee
}

harmonies = \chordmode {
  a2 c
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \text
  >>
  \layout { }
  \midi { }
}

