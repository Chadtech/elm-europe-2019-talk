module Model exposing
    ( Model
    , digress
    , init
    , progress
    , setSlide
    )

import Browser.Navigation as Nav
import Route exposing (Route)
import Slide exposing (Slide)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type alias Model =
    { slide : Slide
    , audioPlayerHtmlId : String
    , navKey : Nav.Key
    }


init : Nav.Key -> Model
init key =
    { slide = Slide.Blank
    , audioPlayerHtmlId = "audio-player"
    , navKey = key
    }



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


setSlide : Slide -> Model -> Model
setSlide slide model =
    { model | slide = slide }


progress : Model -> Cmd msg
progress model =
    Route.goTo model.navKey (Slide.next model.slide)


digress : Model -> Cmd msg
digress model =
    Route.goTo model.navKey (Slide.prev model.slide)
