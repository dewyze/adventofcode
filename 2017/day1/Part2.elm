module Part2 exposing (..)

import Debug
import List.Extra exposing (splitAt, zip)
import Maybe exposing (andThen)


solve : String -> Maybe Int
solve input =
    let
        chars =
            String.toList input
    in
    process chars


process : List Char -> Maybe Int
process list =
    List.head list
        |> andThen (\num -> Just (list ++ [ num ]))
        |> andThen (\list -> Just (List.map (\item -> convert item) list))
        |> andThen (\list -> Just (splitAt (List.length list // 2) list))
        |> andThen (\( x, y ) -> Just (zip x y))
        |> andThen
            (\list ->
                Just
                    (List.filterMap
                        (\( x, y ) ->
                            if x == y then
                                Just [ x, y ]
                            else
                                Nothing
                        )
                        list
                    )
            )
        |> andThen (\groups -> Just (List.concat groups))
        |> andThen (\nums -> Just (List.sum nums))


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
