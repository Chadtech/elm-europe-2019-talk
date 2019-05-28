module View.Image exposing
    ( Image(..)
    , view
    )

import Css exposing (Style, pct, width)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attrs



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Image
    = Humio
    | SineWaveDemo



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


view : List Style -> Image -> Html msg
view styles image =
    Html.img
        [ Attrs.src <| "./" ++ toFilePathBase image ++ ".png"
        , Attrs.css styles
        ]
        []
