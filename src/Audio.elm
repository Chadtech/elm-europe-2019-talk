port module Audio exposing
    ( Audio(..)
    , play
    )

import Json.Encode as Encode



--------------------------------------------------------------------------------
-- TYPES --
--------------------------------------------------------------------------------


type Audio
    = SineWaveDemo



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toFilePath : Audio -> String
toFilePath audio =
    case audio of
        SineWaveDemo ->
            "./sine-wave-demo.mp3"


play : String -> Audio -> Cmd msg
play htmlId audio =
    [ Tuple.pair "htmlId" <| Encode.string htmlId
    , Tuple.pair "filePath" <| Encode.string (toFilePath audio)
    ]
        |> Encode.object
        |> playAudio


port playAudio : Encode.Value -> Cmd msg
