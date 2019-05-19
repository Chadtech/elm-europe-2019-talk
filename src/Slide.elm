module Slide exposing (Slide(..), next, prev)

import Route exposing (Route)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Slide
    = Title
    | Theory
    | End
      --
    | PageDoesntExist
    | Blank



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


next : Slide -> Route
next slide =
    case slide of
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


prev : Slide -> Route
prev slide =
    case slide of
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
