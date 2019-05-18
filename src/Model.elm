module Model exposing
    ( Model(..)
    , digress
    , init
    , progress
    )

--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------

import Route exposing (Route)


type Model
    = Title
    | Theory
    | End
      --
    | PageDoesntExist
    | Blank


init : Model
init =
    Blank



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


progress : Model -> Route
progress model =
    case model of
        Title ->
            Route.Theory

        Theory ->
            Route.End

        End ->
            Route.End

        PageDoesntExist ->
            Route.Title

        Blank ->
            Route.Title


digress : Model -> Route
digress model =
    case model of
        Title ->
            Route.Title

        Theory ->
            Route.Title

        End ->
            Route.Title

        PageDoesntExist ->
            Route.Title

        Blank ->
            Route.Title
