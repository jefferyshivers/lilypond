%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "expressive-marks, unfretted-strings"

%% Translation of GIT committish: dff50e8e1d3134657a6b6203b9c93826dc4cef65
  texidoces = "
Para hacer más pequeño el círculo de @code{\\flageolet} (armónico)
utilice la siguiente función de Scheme.

"
  doctitlees = "Cambiar el tamaño de la marca de \\flageolet"

%% Translation of GIT committish: 0099693675b95c7ec6664d7277f22411a14e9c1b

  texidocfr = "
Il est possible de rapetisser le cercle d'un @code{\\flageolet} grâce 
à une fonction Scheme. 

"
  doctitlefr = "Modifier la taille d'un \\flageolet"

%% Translation of GIT committish: 33f623301a41fcc53efadf96bca1c72834763415
  texidocde = "
Um den @code{\\flageolet}-Kreis kleiner zu machen, kann diese
Scheme-Funktion eingesetzt werden.

"
  doctitlede = "\\flageolet-Zeichen verkleinern"

  texidoc = "
To make the @code{\\flageolet} circle smaller use the following Scheme
function. 

"
  doctitle = "Changing \\flageolet mark size"
} % begin verbatim

smallFlageolet =
#(let ((m (make-music 'ArticulationEvent
                      'articulation-type "flageolet")))
   (ly:music-set-property! m 'tweaks
     (acons 'font-size -3
       (ly:music-property m 'tweaks)))
  m)

\layout { ragged-right = ##f }

\relative c'' {
  d4^\flageolet_\markup { default size } d_\flageolet
  c4^\smallFlageolet_\markup { smaller } c_\smallFlageolet
}

