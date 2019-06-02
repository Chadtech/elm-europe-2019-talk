module Slide.Pipes exposing (view)

import Audio
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Events as Events
import Msg exposing (Msg)
import Style.Units as Units
import View.Button as Button
import View.Helpers as View
import View.Image as Image



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html Msg)
view =
    [ View.header "Pipes"
    , View.line [] "Generally speaking, metal pipes produce sine waves"
    , View.line [] "one cylindrical pipe = one sine wave (ideal conditions)"
    , View.line [] "Two clips from a recording of a flute:"
    , Grid.row
        [ marginTop (px Units.size3)
        , justifyContent center
        , flex (int 1)
        ]
        [ Grid.column
            [ height (pct 100) ]
            [ Image.view
                [ Image.Caption "Two clips from a recording of a flute from wikipedia"
                ]
                Image.FluteAudio
            ]
        ]
    , Grid.row
        [ marginTop (px Units.size3)
        , justifyContent spaceAround
        ]
        [ Grid.column
            [ flex none ]
            [ Button.view
                [ Events.onClick <| Msg.playClicked Audio.IdealFlute ]
                "play actual flute recording"
            ]
        , Grid.column
            [ flex none ]
            [ Button.view
                [ Events.onClick <| Msg.playClicked Audio.IdealFluteSineWave ]
                "play sine wave of the same freq "
            ]
        ]
    ]
