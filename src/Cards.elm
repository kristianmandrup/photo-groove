module Main exposing (..)

import Html exposing (Html, div, input, p, text)
import Html.Attributes exposing (style, placeholder)


main : Html msg
main =
    div [ mainStyle ]
        [ input
            [ inputStyle
            , placeholder "Type your card..."
            ]
            []
        , p [ cardStyle ] [ text "Seven of Club" ]
        ]


mainStyle : Html.Attribute msg
mainStyle =
    style
        [ ( "font-family", "-apple-system, system, sans-serif" )
        , ( "margin", "10px" )
        , ( "padding", "40px" )
        , ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "align-items", "stretch" )
        , ( "background-color", "#fafafa" )
        , ( "border", "lightgray solid 1px" )
        ]


inputStyle : Html.Attribute msg
inputStyle =
    style
        [ ( "border", "#fafafa solid" )
        , ( "border-bottom", "lightgray solid 1px" )
        , ( "font-size", "2em" )
        , ( "color", "rgba(0,0,0,0.75)" )
        , ( "background-color", "#fafafa" )
        ]


cardStyle : Html.Attribute msg
cardStyle =
    style
        [ ( "font-size", "2em" )
        , ( "color", "rgba(0,0,0,0.75)" )
        ]
