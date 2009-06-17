%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "rhythms"

%% Translation of GIT committish: 43774ddb81b9017802da04ba2862cae4586935b2
  texidoces = "
Las reglas de final de barra especificadas en el contexto
@code{Score} se aplican a todos los pentagramas, pero se pueden
modificar tanto en los niveles de @code{Staff} como de
@code{Voice}:

"
  doctitlees = "Finales de barra en el contexto Score"

%% Translation of GIT committish: 0364058d18eb91836302a567c18289209d6e9706
  texidocde = "
Balkenenderegeln, die im @code{Score}-Kontext definiert werden, wirken
sich auf alle Systeme aus, können aber auf @code{Staff}- und
@code{Voice}-Ebene neu verändert werden:

"
  doctitlede = "Balkenenden auf Score-Ebene"

  texidoc = "
Beam-ending rules specified in the @code{Score} context apply to all
staves, but can be modified at both @code{Staff} and @code{Voice}
levels: 

"
  doctitle = "Beam endings in Score context"
} % begin verbatim

\relative c'' {
  \time 5/4
  % Set default beaming for all staves
  #(score-override-auto-beam-setting '(end * * 5 4) 3 8)
  #(score-override-auto-beam-setting '(end * * 5 4) 7 8)
  <<
    \new Staff {
      c8 c c c c c c c c c
    }
    \new Staff {
      % Modify beaming for just this staff
      #(override-auto-beam-setting '(end * * 5 4) 6 8 'Staff)
      #(revert-auto-beam-setting '(end * * 5 4) 7 8 'Staff)
      c8 c c c c c c c c c
    }
    \new Staff {
      % Inherit beaming from Score context
      <<
        {
          \voiceOne
          c8 c c c c c c c c c
        }
        % Modify beaming for this voice only
        \new Voice {
          \voiceTwo
          #(override-auto-beam-setting '(end * * 5 4) 6 8)
          #(revert-auto-beam-setting '(end * * 5 4) 7 8)
          a8 a a a a a a a a a
        }
      >>
    }
  >>
}

