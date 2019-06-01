module View.Image exposing
    ( Image(..)
    , Param(..)
    , view
    )

import Css exposing (..)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs
import Style.Units as Units
import View.Helpers as View



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Image
    = Humio
    | SineWaveDemo
    | FluteAudio



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toFilePathBase : Image -> String
toFilePathBase image =
    case image of
        Humio ->
            "humio"

        SineWaveDemo ->
            "sine-wave-demo"

        FluteAudio ->
            "flute-demo"


type Param
    = Styles (List Style)
    | Caption String


type alias Summary =
    { maybeCaption : Maybe String
    , styles : List Style
    }


makeSummary : List Param -> Summary
makeSummary params =
    let
        modifySummary : Param -> Summary -> Summary
        modifySummary param summary =
            case param of
                Styles styles ->
                    { summary | styles = styles ++ summary.styles }

                Caption str ->
                    { summary | maybeCaption = Just str }

        makeSummaryHelper : List Param -> Summary -> Summary
        makeSummaryHelper remainingParams summary =
            case remainingParams of
                first :: rest ->
                    makeSummaryHelper rest <| modifySummary first summary

                [] ->
                    summary
    in
    makeSummaryHelper
        params
        { maybeCaption = Nothing
        , styles = []
        }


view : List Param -> Image -> Html msg
view params image =
    let
        summary : Summary
        summary =
            makeSummary params

        captionView : Html msg
        captionView =
            case summary.maybeCaption of
                Just caption ->
                    View.words
                        [ fontSize (px Units.size4) ]
                        caption

                Nothing ->
                    Html.text ""
    in
    Html.div
        []
        [ Html.img
            [ Attrs.src <| "./" ++ toFilePathBase image ++ ".png"
            , Attrs.css summary.styles
            ]
            []
        , captionView
        ]
