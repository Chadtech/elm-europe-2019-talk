module Slide exposing
    ( Slide(..)
    , fromRoute
    , next
    , prev
    , view
    )

import Audio
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled exposing (Html)
import Html.Styled.Events as Events
import Msg exposing (Msg)
import Route exposing (Route)
import Style.Units as Units
import View.Button as Button
import View.Helpers as View
import View.Image as Image



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Slide
    = FromRoute Route
    | SlideDoesntExist



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toRoute : Slide -> Route
toRoute slide =
    case slide of
        FromRoute route ->
            route

        SlideDoesntExist ->
            Route.Title


fromRoute : Route -> Slide
fromRoute =
    FromRoute


next : Slide -> Route
next =
    Route.next << toRoute


prev : Slide -> Route
prev =
    Route.prev << toRoute



--------------------------------------------------------------------------------
-- VIEW --
--------------------------------------------------------------------------------


view : Slide -> List (Html Msg)
view slide =
    case slide of
        SlideDoesntExist ->
            [ View.box
                [ displayFlex
                , flex (int 1)
                , flexDirection column
                , justifyContent center
                ]
                [ Grid.row
                    []
                    [ Grid.column
                        [ justifyContent center ]
                        [ View.words
                            []
                            "This slide does not exist"
                        ]
                    ]
                , Grid.row
                    [ marginTop <| px Units.size3 ]
                    [ Grid.column
                        [ justifyContent center ]
                        [ Button.view
                            [ Events.onClick Msg.goToTitleClicked ]
                            "go to title slide"
                        ]
                    ]
                ]
            ]

        FromRoute route ->
            viewRoute route


viewRoute : Route -> List (Html Msg)
viewRoute route =
    case route of
        Route.Title ->
            [ View.words
                [ fontSize (px Units.size6) ]
                "What has excited me about audio synthesis theory"
            , View.words
                [ fontSize (px Units.size6)
                , marginTop (px Units.size6)
                ]
                "by Chadtech"
            ]

        Route.Intro ->
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
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100)
                    , justifyContent center
                    ]
                    [ Image.view
                        []
                        Image.Humio
                    ]
                ]
            ]

        Route.Theory ->
            [ Grid.row
                [ marginBottom <| px Units.size5 ]
                [ View.words
                    [ fontSize <| px Units.size6 ]
                    "What do I mean by a theory of audio?"
                ]
            , View.line
                [ fontSize <| px Units.size5 ]
                """
                    A model for thinking and talking about sounds
                    that would make you better at working with sounds
                    """
            ]

        Route.AdditiveSynthesis ->
            [ View.header "Additive Synthesis"
            , View.line
                []
                "The theory that all sounds are just combinations of sine waves"
            , Grid.row
                [ justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100)
                    , justifyContent center
                    ]
                    [ Image.view
                        []
                        Image.SineWaveDemo
                    ]
                ]
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                ]
                [ Button.view
                    [ Events.onClick <| Msg.playClicked Audio.SineWaveDemo ]
                    "play"
                ]
            ]

        Route.Pipes ->
            [ View.header "Pipes"
            , View.line [] "one cylindrical pipe = one sine wave"
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100) ]
                    [ Image.view
                        [ Image.Caption "Actual flute recording (totally cherry picked example)"
                        , Image.Styles
                            [ width (pct 100) ]
                        ]
                        Image.FluteAudio
                    ]
                ]
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent spaceAround
                ]
                [ Grid.column
                    [ flex none ]
                    [ Button.view
                        [ Events.onClick <| Msg.playClicked Audio.IdealFlute ]
                        "play actual flute recording"
                    ]
                , Grid.column
                    [ flex none ]
                    [ Button.view
                        [ Events.onClick <| Msg.playClicked Audio.IdealFluteSineWave ]
                        "play sine wave of the same freq "
                    ]
                ]
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100) ]
                    [ Image.view
                        []
                        Image.OrganPipes
                    ]
                ]
            ]

        Route.Organ ->
            [ View.header "Pipes, Organs"
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100) ]
                    [ Image.view
                        [ Image.Styles
                            [ width (pct 100) ]
                        ]
                        Image.IdealOrgan
                    ]
                ]
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    [ height (pct 100) ]
                    [ Image.view
                        [ Image.Styles
                            [ width (pct 100) ]
                        ]
                        Image.UnidealOrgan
                    ]
                ]
            ]

        Route.PipesError ->
            [ View.header "Complexity, where does it come from?"
            , View.line [] "The error is also sine waves"
            , Grid.row
                [ marginTop (px Units.size3)
                , justifyContent center
                , flex (int 1)
                ]
                [ Grid.column
                    []
                    [ Image.view
                        [ Image.Styles
                            [ width (pct 100) ]
                        ]
                        Image.OrganPipeTypes
                    ]
                , Grid.column
                    [ height (pct 100) ]
                    [ View.box
                        [ displayFlex
                        , flexDirection column
                        ]
                        [ Grid.row
                            [ justifyContent center
                            ]
                            [ Grid.column
                                [ height (pct 100) ]
                                [ Image.view
                                    [ Image.Styles
                                        [ width (pct 100) ]
                                    ]
                                    Image.PipeResonator
                                ]
                            ]
                        , Grid.row
                            [ justifyContent center
                            ]
                            [ Grid.column
                                [ height (pct 100) ]
                                [ Image.view
                                    [ Image.Styles
                                        [ width (pct 100) ]
                                    ]
                                    Image.FluteBlowSpot
                                ]
                            ]
                        ]
                    ]
                ]
            ]

        Route.GranularSynthesis ->
            [ View.header "Granular Synthesis"
            , View.line [] "Theory that all sounds are sequences of short little sound bits called 'grains'"
            , View.line [] "a 'grain' of sound is roughly 1ms long"
            ]

        Route.End ->
            [ Grid.row
                []
                [ View.words
                    [ fontSize (px Units.size6) ]
                    "The End"
                ]
            , Grid.row
                [ marginTop (px Units.size5) ]
                [ View.words
                    [ fontSize (px Units.size6) ]
                    "Thank you"
                ]
            , Grid.row
                [ marginTop (px Units.size5) ]
                [ Grid.column
                    [ flexDirection column ]
                    [ View.line [] "github.com/chadtech"
                    , View.line [] "twitter @TheRealChadtech"
                    , View.line [] "these slides are an Elm project = github.com/Chadtech/elm-europe-2019-talk"
                    ]
                ]
            ]
