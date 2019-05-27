module Slide.Title exposing (view)

import Css exposing (fontSize, marginTop, px)
import Html.Styled as Html exposing (Html)
import Style.Units as Units
import Svg.Styled.Attributes as Attrs



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html msg)
view =
    [ Html.p
        [ Attrs.css
            [ fontSize (px Units.size6) ]
        ]
        [ Html.text "What has excited me about audio synthesis theory" ]
    , Html.p
        [ Attrs.css
            [ fontSize (px Units.size6)
            , marginTop (px Units.size6)
            ]
        ]
        [ Html.text "by Chadtech" ]
    ]
