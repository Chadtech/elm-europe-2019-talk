module Slide.Intro exposing (view)

import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Style.Units as Units
import View.Helpers as View
import View.Image as Image



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
        [ justifyContent center
        , flexDirection row
        ]
        [ Grid.column
            [ flex none ]
            [ Image.view
                []
                Image.Humio
            ]
        ]
    ]
