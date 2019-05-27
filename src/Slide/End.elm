module Slide.End exposing (view)

import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Style.Units as Units
import View.Helpers as View



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html msg)
view =
    [ Grid.row
        []
        [ View.words
            [ fontSize (px Units.size6) ]
            "The End"
        ]
    , Grid.row
        [ marginTop (px Units.size5) ]
        [ View.words
            [ fontSize (px Units.size6) ]
            "Thank you"
        ]
    , Grid.row
        [ marginTop (px Units.size5) ]
        [ Grid.column
            [ flexDirection column ]
            [ View.line [] "github.com/chadtech"
            , View.line [] "twitter @TheRealChadtech"
            , View.line [] "these slides are an Elm project = github.com/Chadtech/elm-europe-2019-talk"
            ]
        ]
    ]
