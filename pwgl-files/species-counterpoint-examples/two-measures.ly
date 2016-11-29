
\version "2.18.2"
% automatically converted by musicxml2ly from two-measures.xml

\header {
    encodingsoftware = "MusicXML-PWGL v0.1.132"
    encodingdate = "2016-08-25"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c' {
    \clef "treble" \numericTimeSignature\time 4/4 c1 | % 2
    c1 \bar "|."
    }


% The score definition
\score {
    <<
        \new Staff <<
            \context Staff << 
                \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

