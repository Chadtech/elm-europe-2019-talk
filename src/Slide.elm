module Slide exposing
    ( Slide(..)
    , fromRoute
    , next
    , prev
    )

import Route exposing (Route)



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Slide
    = Title
    | Intro
    | Theory
    | AdditiveSynthesis
    | Pipes
    | End
      --
    | PageDoesntExist
    | Blank



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toRoute : Slide -> Route
toRoute slide =
    case slide of
        Title ->
            Route.Title

        Intro ->
            Route.Intro

        Theory ->
            Route.Theory

        AdditiveSynthesis ->
            Route.AdditiveSynthesis

        Pipes ->
            Route.Pipes

        End ->
            Route.End

        Blank ->
            Route.Title

        PageDoesntExist ->
            Route.Title


fromRoute : Route -> Slide
fromRoute route =
    case route of
        Route.Title ->
            Title

        Route.Intro ->
            Intro

        Route.Theory ->
            Theory

        Route.AdditiveSynthesis ->
            AdditiveSynthesis

        Route.Pipes ->
            Pipes

        Route.End ->
            End


next : Slide -> Route
next =
    Route.next << toRoute


prev : Slide -> Route
prev =
    Route.prev << toRoute
