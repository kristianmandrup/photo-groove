module Main exposing (..)

import Html exposing (Html, div, input, p, text)
import Html.Attributes exposing (style, placeholder)
import CardParser


type alias Model =
    String


init : String -> Model
init str =
    str


view model =
    let
        card =
            spellCard model
    in
        div
            [ mainStyle ]
            [ input
                [ inputStyle
                , placeholder "Type your card..."
                ]
                []
            , p [ cardStyle ] [ text card ]
            ]


main : Html msg
main =
    Html.beginnerProgram
        { model = init ""
        , view = view
        , update = update
        }


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
