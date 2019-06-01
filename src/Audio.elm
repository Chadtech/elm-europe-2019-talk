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
    | IdealFlute
    | IdealFluteSineWave



--------------------------------------------------------------------------------
-- HELPERS --
--------------------------------------------------------------------------------


toFilePathBase : Audio -> String
toFilePathBase audio =
    case audio of
        SineWaveDemo ->
            "sine-wave-demo"

        IdealFlute ->
            "ideal-flute"

        IdealFluteSineWave ->
            "flute-tone"


toFilePath : Audio -> String
toFilePath audio =
    "./" ++ toFilePathBase audio ++ ".mp3"


play : String -> Audio -> Cmd msg
play htmlId audio =
    [ Tuple.pair "htmlId" <| Encode.string htmlId
    , Tuple.pair "filePath" <| Encode.string (toFilePath audio)
    ]
        |> Encode.object
        |> playAudio


port playAudio : Encode.Value -> Cmd msg
