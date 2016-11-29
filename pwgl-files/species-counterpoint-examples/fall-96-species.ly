
\version "2.18.2"
% automatically converted by musicxml2ly from fall-96-species.xml

\header {
    encodingsoftware = "MusicXML-PWGL v0.1.132"
    encodingdate = "2016-08-25"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative dis'' {
    \clef "treble" \numericTimeSignature\time 4/4 \times 2/1 {
        r4 dis4 }
    | % 2
    \times 2/1  {
        d4 c4 }
    | % 3
    \times 2/1  {
        d4 f4 }
    | % 4
    \times 2/1  {
        g4 dis4 }
    | % 5
    \times 2/1  {
        ais4 gis4 }
    | % 6
    \times 2/1  {
        g4 dis'4 }
    | % 7
    \times 2/1  {
        c4 gis4 }
    | % 8
    \times 2/1  {
        ais4 c4 }
    | % 9
    d1 | \barNumberCheck #10
    dis1 \bar "|."
    }

PartPTwoVoiceNone =  \relative dis' {
    \clef "treble" \numericTimeSignature\time 4/4 dis1 | % 2
    ais'1 | % 3
    gis1 | % 4
    g1 | % 5
    f1 | % 6
    c1 | % 7
    dis1 | % 8
    g1 | % 9
    gis1 | \barNumberCheck #10
    g1 \bar "|."
    }

PartPThreeVoiceNone =  \relative dis {
    \clef "treble" \numericTimeSignature\time 4/4 dis1 | % 2
    g1 | % 3
    f1 | % 4
    c1 | % 5
    d1 | % 6
    dis1 | % 7
    gis1 | % 8
    g1 | % 9
    f1 | \barNumberCheck #10
    dis1 \bar "|."
    }


% The score definition
\score {
    <<
        \new Staff <<
            \context Staff << 
                \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                >>
            >>
        \new Staff <<
            \context Staff << 
                \context Voice = "PartPTwoVoiceNone" { \PartPTwoVoiceNone }
                >>
            >>
        \new Staff <<
            \context Staff << 
                \context Voice = "PartPThreeVoiceNone" { \PartPThreeVoiceNone }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

