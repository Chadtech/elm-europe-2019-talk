module View exposing (view)

import Browser
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
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
        [ Style.globals
        , Html.audio [ Attrs.id model.audioPlayerHtmlId ] []
        ]
            ++ viewBody model
            |> List.map Html.toUnstyled
    }


viewBody : Model -> List (Html Msg)
viewBody model =
    case model.slide of
        Slide.Blank ->
            []

        Slide.PageDoesntExist ->
            frame model
                [ Html.p
                    []
                    [ Html.text "This page does not exist" ]
                ]

        Slide.Title ->
            frame model Title.view

        Slide.Intro ->
            frame model Intro.view

        Slide.Theory ->
            frame model Theory.view

        Slide.AdditiveSynthesis ->
            frame model AdditiveSynthesis.view

        Slide.End ->
            frame model End.view


frame : Model -> List (Html Msg) -> List (Html Msg)
frame model children =
    [ Grid.row
        [ flexDirection column
        , justifyContent center
        , height (pct 100)
        , padding <| px Units.size5
        ]
        [ Grid.column
            [ flex (int 1)
            , height (pct 100)
            ]
            [ Card.view
                [ maxWidth (px 1000)
                , Style.center
                , flex (int 1)
                ]
                [ Card.body
                    [ Grid.row
                        [ flexDirection column ]
                        children
                    , timeView model
                    ]
                ]
            ]
        ]
    ]


timeView : Model -> Html Msg
timeView model =
    Grid.row
        []
        [ Html.p
            [ Attrs.css [ fontSize <| px Units.size5 ] ]
            [ Html.text <| "time = " ++ Model.formattedTime model ]
        ]
