module View.Helpers exposing
    ( additiveSynthesisHeader
    , line
    , words
    )

import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
import Style.Units as Units


line : List Style -> String -> Html msg
line styles content =
    Grid.row
        [ marginTop (px Units.size2)
        , marginBottom (px Units.size2)
        ]
        [ words styles ("* " ++ content) ]


words : List Style -> String -> Html msg
words styles content =
    Html.p
        [ Attrs.css
            [ fontSize (px Units.size5)
            , Css.batch styles
            ]
        ]
        [ Html.text content ]


additiveSynthesisHeader : Html msg
additiveSynthesisHeader =
    Grid.row
        [ marginBottom <| px Units.size5 ]
        [ words
            [ fontSize <| px Units.size6 ]
            "Additive Synthesis"
        ]
