module Slide.AdditiveSynthesis exposing (view)

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
    [ View.additiveSynthesisHeader
    , View.line
        []
        "The theory that all sounds are just combinations of sine waves"
    , Grid.row
        [ justifyContent center
        , height (pct 50)
        ]
        [ Image.view
            [ width (pct 60) ]
            Image.SineWaveDemo
        ]
    , Grid.row
        [ marginTop (px Units.size3)
        , justifyContent center
        ]
        [ Button.view
            [ Events.onClick <| Msg.playClicked Audio.SineWaveDemo ]
            "play"
        ]
    ]
