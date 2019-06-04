module Slide.Title exposing (view)

import Css exposing (fontSize, marginTop, px)
import Html.Styled as Html exposing (Html)
import Style.Units as Units
import View.Helpers as View



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html msg)
view =
    [ View.words
        [ fontSize (px Units.size6) ]
        "What has excited me about audio synthesis theory"
    , View.words
        [ fontSize (px Units.size6)
        , marginTop (px Units.size6)
        ]
        "by Chadtech"
    ]
