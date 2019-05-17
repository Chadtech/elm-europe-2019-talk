module View.Button exposing
    ( disabled
    , margins
    , selected
    , styles
    , view
    )

import Chadtech.Colors as Ct
import Css exposing (..)
import Html.Styled as Html
    exposing
        ( Attribute
        , Html
        )
import Style as Style
import Style.Units as Units


view : List (Attribute msg) -> String -> Html msg
view attrs label =
    Html.button
        attrs
        [ Html.text label ]


margins : Style
margins =
    margin2 zero (px Units.size1)


disabled : Style
disabled =
    [ basic
    , cursor default
    , backgroundColor Ct.content2
    , color Ct.content3
    ]
        |> Css.batch


selected : Style
selected =
    [ basic
    , backgroundColor Ct.content1
    , color Ct.content5
    , Style.indent
    , hover [ color Ct.content5 ]
    ]
        |> Css.batch


styles : Style
styles =
    [ basic
    , backgroundColor Ct.content1
    , color Ct.content4
    , hover
        [ color Ct.content5
        ]
    , active
        [ color Ct.content5
        , Style.indent
        ]
    ]
        |> Css.batch


basic : Style
basic =
    [ Style.hfnss
    , Style.fontSmoothingNone
    , outline none
    , minWidth (px Units.size6)
    , height (px Units.size4)
    , boxSizing borderBox
    , padding2 zero (px Units.size3)
    , cursor pointer
    , Style.outdent
    ]
        |> Css.batch
