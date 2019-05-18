module Msg exposing
    ( Msg(..)
    , arrowKeyDecoder
    )

import Browser exposing (UrlRequest)
import Json.Decode as Decode exposing (Decoder)
import Route exposing (Route)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Msg
    = RouteChanged (Maybe Route)
    | UrlRequested UrlRequest
    | LeftPressed
    | RightPressed



--------------------------------------------------------------------------------
-- DECODERS --
--------------------------------------------------------------------------------


arrowKeyDecoder : Decoder Msg
arrowKeyDecoder =
    let
        decoderFromString : String -> Decoder Msg
        decoderFromString str =
            case str of
                "ArrowLeft" ->
                    Decode.succeed LeftPressed

                "ArrowRight" ->
                    Decode.succeed RightPressed

                _ ->
                    Decode.fail "Not an arrow key"
    in
    Decode.string
        |> Decode.andThen decoderFromString
