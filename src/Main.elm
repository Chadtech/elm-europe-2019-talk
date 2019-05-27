module Main exposing (main)

import Audio
import Browser
import Browser.Events
import Browser.Navigation as Nav
import Json.Decode as Decode
import Model exposing (Model)
import Msg exposing (Msg(..))
import Route exposing (Route)
import Slide
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
    Model.init key
        |> handleRoute (Route.fromUrl url)
        |> CmdUtil.withNoCmd



--------------------------------------------------------------------------------
-- SUBSCRIPTIONS --
--------------------------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onKeyDown
        (Decode.field "key" Msg.arrowKeyDecoder)



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

        LeftPressed ->
            ( model, Model.digress model )

        RightPressed ->
            ( model, Model.progress model )

        PlayClicked audio ->
            ( model, Audio.play model.audioPlayerHtmlId audio )


handleRoute : Maybe Route -> Model -> Model
handleRoute maybeRoute =
    case maybeRoute of
        Nothing ->
            Model.setSlide Slide.PageDoesntExist

        Just route ->
            route
                |> Slide.fromRoute
                |> Model.setSlide
