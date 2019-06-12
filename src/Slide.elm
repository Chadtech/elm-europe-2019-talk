module Slide exposing
    ( Slide(..)
    , fromRoute
    , next
    , prev
    , view
    )

import Audio exposing (Audio)
import Css exposing (..)
import Html.Grid as Grid
import Html.Styled exposing (Html)
import Html.Styled.Events as Events
import Msg exposing (Msg)
import Route exposing (Route)
import Style.Units as Units
import View.Button as Button
import View.Helpers as View
import View.Image as Image exposing (Image)



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
                    [ View.header "Humio"
                    , View.line [] "big and old Elm front end"
                    , View.line [] "HIRING"
                    , View.line [] "log management platform"
                    , View.line [] "\"Log Everything and Answer Anything\""
                    ]
                ]
            , Grid.row
                [ justifyContent center
                , flex (int 1)
                , marginTop (px Units.size3)
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
                [ buttonColumn
                    "play actual flute recording"
                    Audio.IdealFlute
                , buttonColumn
                    "play sine wave of same freq"
                    Audio.IdealFlute__SineWave
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

        Route.Pipes__Organ ->
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

        Route.Pipes__Error ->
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
            granularSynthesis Image.ElmVoice

        Route.GranularSynthesis__Diagrammed ->
            granularSynthesis Image.ElmVoice__Diagrammed

        Route.InternetVoiceChat ->
            [ View.header "Internet Voice Chat"
            , View.line [] "Software like skype, slack, zoom, operate on the principles of Granular theory"
            , View.line [] "What to do if some grains are missing? Answer : just use the previous grain"
            , View.line [] "This works because generally, the grains of a human voice, greatly resemble its neighboring grains"
            , Image.view
                []
                Image.InternetVoiceChat
            ]

        Route.Violin ->
            [ View.header "Violins"
            , View.line [] "the actual wave form of a violin is not particularly elegant"
            , Image.view [] Image.Violin_0
            , Image.view [] Image.Violin_1
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


granularSynthesis : Image -> List (Html Msg)
granularSynthesis image =
    [ View.header "Granular Synthesis"
    , View.line [] "Theory that all sounds are sequences of short little sound bits called \"grains\""
    , View.line [] "a \"grain\" of sound is roughly 1ms long"
    , Grid.row
        [ marginTop (px Units.size3)
        , justifyContent center
        , flex (int 1)
        ]
        [ Grid.column
            [ height (pct 100) ]
            [ Image.view
                [ Image.Caption "My voice saying \"elm\""
                , Image.Styles
                    [ width (pct 100) ]
                ]
                image
            ]
        ]
    , Grid.row
        [ marginTop (px Units.size3)
        , justifyContent spaceAround
        ]
        [ buttonColumn "\"elm\"" Audio.ElmVoice
        , buttonColumn "\"e\"" Audio.ElmVoice__E
        , buttonColumn "\"l\"" Audio.ElmVoice__L
        , buttonColumn "\"m\"" Audio.ElmVoice__M
        , buttonColumn "\"uh\"" Audio.ElmVoice__Uh
        , buttonColumn "all together" Audio.ElmVoice__AllTogether
        ]
    ]


buttonColumn : String -> Audio -> Html Msg
buttonColumn label audio =
    Grid.column
        [ flex none ]
        [ Button.view
            [ Events.onClick <| Msg.playClicked audio ]
            ("play " ++ label ++ "")
        ]
