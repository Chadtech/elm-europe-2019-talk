module Route exposing
    ( Route(..)
    , fromUrl
    , toLabel
    , toUrlString
    )

-- TYPES --

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, s, top)


type Route
    = Title
    | Theory
    | End



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toLabel : Route -> String
toLabel route =
    case route of
        Title ->
            "title"

        Theory ->
            "theory"

        End ->
            "end"


toUrlString : Route -> String
toUrlString route =
    case route of
        Title ->
            "title"

        Theory ->
            "theory"

        End ->
            "End"


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Title (top </> s "title")
        , Parser.map Title top
        , Parser.map End (top </> s "end")
        , Parser.map Theory (top </> s "theory")
        ]
