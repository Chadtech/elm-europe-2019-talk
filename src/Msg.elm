module Msg exposing (Msg(..))

import Browser exposing (UrlRequest)
import Route exposing (Route)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Msg
    = RouteChanged (Maybe Route)
    | UrlRequested UrlRequest
