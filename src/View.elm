module View exposing (view)

import Browser
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
import Html.Styled.Events as Events
import Model exposing (Model(..))
import Msg exposing (Msg(..))
import Style
import Style.Units as Units
import View.Card as Card


view : Model -> Browser.Document Msg
view model =
    { title = "What has excited me about audio synthesis theory"
    , body =
        Style.globals
            :: viewBody model
            |> List.map Html.toUnstyled
    }


viewBody : Model -> List (Html Msg)
viewBody model =
    case model of
        Blank ->
            []

        PageDoesntExist ->
            [ Html.p
                []
                [ Html.text "Wow" ]
            ]

        Title ->
            [ frame
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
            ]


frame : List (Html Msg) -> Html Msg
frame children =
    Grid.row
        [ flexDirection column
        , justifyContent center
        , alignItems center
        , height (pct 100)
        , paddingTop <| px Units.size4
        , paddingBottom <| px Units.size4
        ]
        [ Grid.column
            []
            [ Card.view
                [ width (px 1000)
                , Style.center
                ]
                [ Card.body
                    children
                ]
            ]
        ]
