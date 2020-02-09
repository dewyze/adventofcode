module Part1 exposing (..)

import Debug
import List.Extra exposing (allDifferent, groupsOfWithStep, unique)
import Maybe exposing (andThen)


solve : String -> Int
solve input =
    let
        chars =
            String.toList input
    in
    process chars


process : List Char -> Int
process list =
    let
        first =
            List.head list
    in
    case first of
        Just num ->
            list
                ++ [ num ]
                |> List.map (\item -> convert item)
                |> List.Extra.groupsOfWithStep 2 1
                |> List.filter (not << allDifferent)
                |> List.map unique
                |> List.concat
                |> List.sum

        Nothing ->
            Debug.crash "No list"


convert : Char -> Int
convert char =
    let
        str =
            String.fromChar char
    in
    case String.toInt str of
        Err msg ->
            Debug.crash msg

        Ok val ->
            val
