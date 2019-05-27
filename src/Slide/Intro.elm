module Slide.Intro exposing (view)

import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr
import Style.Units as Units
import View.Helpers as View



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : List (Html msg)
view =
    [ Grid.row
        []
        [ Grid.column
            [ flexDirection column ]
            [ View.line [] "I work at Humio"
            , View.line [] "big and old Elm front end"
            , View.line [] "always kind of hiring"
            , View.line [] "log management tool"
            , View.line [] "competing against industry leaders like Splunk and Elastic Search"
            ]
        ]
    , Grid.row
        [ justifyContent center ]
        [ Grid.column
            [ padding (px Units.size4)
            , maxWidth (px Units.size8)
            ]
            [ Html.img
                [ Attr.src "./humio.png"
                , Attr.css
                    [ width (pct 100) ]
                ]
                []
            ]
        ]
    ]
