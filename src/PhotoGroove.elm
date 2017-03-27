module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


view : a -> Html msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            [ img [ src (urlPrefix ++ "1.jpeg") ] []
            , img [ src (urlPrefix ++ "3.jpeg") ] []
            , img [ src (urlPrefix ++ "3.jpeg") ] []
            ]
        ]


main : Html msg
main =
    view "no model yet"
