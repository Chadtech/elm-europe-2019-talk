module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Json.Decode as Decode
import Model exposing (Model)
import Msg exposing (Msg(..))
import Route exposing (Route)
import Url exposing (Url)
import Util.Cmd as CmdUtil
import View exposing (view)



--------------------------------------------------------------------------------
-- MAIN --
--------------------------------------------------------------------------------


main : Program Decode.Value Model Msg
main =
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = RouteChanged << Route.fromUrl
    , onUrlRequest = UrlRequested
    }
        |> Browser.application


init : Decode.Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    Model.init
        |> handleRoute (Route.fromUrl url)
        |> CmdUtil.withNoCmd



--------------------------------------------------------------------------------
-- SUBSCRIPTIONS --
--------------------------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



--------------------------------------------------------------------------------
-- UPDATE --
--------------------------------------------------------------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RouteChanged maybeRoute ->
            handleRoute maybeRoute model
                |> CmdUtil.withNoCmd

        UrlRequested _ ->
            model
                |> CmdUtil.withNoCmd


handleRoute : Maybe Route -> Model -> Model
handleRoute route model =
    case route of
        Nothing ->
            Model.PageDoesntExist

        Just Route.Title ->
            Model.Title
