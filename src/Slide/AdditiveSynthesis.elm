module Slide.AdditiveSynthesis exposing (view)

import Html.Styled as Html exposing (Html)
import View.Helpers as View



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html msg)
view =
    [ View.additiveSynthesisHeader
    , View.line
        []
        "The theory that all sounds are just sine waves in different combinations"
    , View.line
        []
        "The sine wave is the elemental part of this theory"
    ]
