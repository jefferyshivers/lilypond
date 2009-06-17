%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "fretted-strings"

%% Translation of GIT committish: acbcbe3683d629575967b972b64ca5e1589bf330
  texidoces = "
La dirección de las plicas se contola de la misma forma en la
tablatura que en la notación tradicional. Las barras se pueden
poner horizontales, como se muestra en este ejemplo.

"
  doctitlees = "Comportamiento de las plicas y las barras de corchea en tablaturas"

%% Translation of GIT committish: cd4950757ab1ab6c89805b0b7c978bfca034f940

  texidocfr = "
La direction des hampes se gère dans les tablatures tout comme en 
notation traditionnelle.  Les ligatures peuvent être mises à l'horizontale 
comme le montre cet exemple.

"
  doctitlefr = "Hampes et ligatures en mode tablature"

%% Translation of GIT committish: 33f623301a41fcc53efadf96bca1c72834763415
  texidocde = "
Die Richtung von Hälsen wird in Tabulaturen genauso wie in normaler Notation
eingestellt.  Balken können horizontal eingestellt werden, wie das Beispiel
zeigt.

"
  doctitlede = "Hals- und Balkenverhalten in einer Tabulatur"

  texidoc = "
The direction of stems is controlled the same way in tablature as in
traditional notation. Beams can be made horizontal, as shown in this
example.

"
  doctitle = "Stem and beam behavior in tablature"
} % begin verbatim

\new TabStaff {
  \relative c {
    g16 b d g b d g b
    \stemDown
    \override Beam #'damping = #+inf.0
    g,,16 b d g b d g b
  }
}

