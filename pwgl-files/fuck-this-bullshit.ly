
\version "2.18.2"
% automatically converted by musicxml2ly from fuck-this-bullshit.xml

\header {
    encodingsoftware = "MusicXML-PWGL v0.1.132"
    encodingdate = "2016-08-25"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative e' {
    \clef "treble" \numericTimeSignature\time 4/4 \times 2/1 {
        e4 b'4 }
    | % 2
    a,1 | % 3
    d4 e4 dis4 c4 | % 4
    c4 c4 c4 c4 | % 5
    c4 c4 c4 c4 | % 6
    c4 c4 c4 c4 \bar "|."
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

