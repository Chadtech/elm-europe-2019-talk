module Slide.Theory exposing (view)

import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Style.Units as Units
import View.Helpers as View


view : List (Html msg)
view =
    [ Grid.row
        [ marginBottom <| px Units.size5 ]
        [ View.words
            [ fontSize <| px Units.size6 ]
            "What do I mean by a theory of audio?"
        ]
    , View.line
        [ fontSize <| px Units.size5 ]
        """
        A model for thinking and talking about sounds
        that would make you better at handling sounds
        """
    ]
