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



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toLabel : Route -> String
toLabel route =
    case route of
        Title ->
            "title"


toUrlString : Route -> String
toUrlString route =
    case route of
        Title ->
            "title"


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Title (top </> s "title")
        , Parser.map Title top
        ]
