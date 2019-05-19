module Route exposing
    ( Route(..)
    , fromUrl
    , goTo
    , toLabel
    , toUrlString
    )

import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, s, top)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


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


goTo : Nav.Key -> Route -> Cmd msg
goTo key =
    toUrlString >> Nav.pushUrl key
