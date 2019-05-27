module View exposing (view)

import Browser
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Slide as Slide
import Slide.AdditiveSynthesis as AdditiveSynthesis
import Slide.End as End
import Slide.Intro as Intro
import Slide.Theory as Theory
import Slide.Title as Title
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
    case model.slide of
        Slide.Blank ->
            []

        Slide.PageDoesntExist ->
            frame
                [ Html.p
                    []
                    [ Html.text "This page does not exist" ]
                ]

        Slide.Title ->
            frame Title.view

        Slide.Intro ->
            frame Intro.view

        Slide.Theory ->
            frame Theory.view

        Slide.AdditiveSynthesis ->
            frame AdditiveSynthesis.view

        Slide.End ->
            frame End.view


frame : List (Html Msg) -> List (Html Msg)
frame children =
    [ Grid.row
        [ flexDirection column
        , justifyContent center
        , height (pct 100)
        , padding <| px Units.size5
        ]
        [ Grid.column
            [ flex (int 1) ]
            [ Card.view
                [ maxWidth (px 1000)
                , Style.center
                , flex (int 1)
                ]
                [ Card.body
                    children
                ]
            ]
        ]
    ]
