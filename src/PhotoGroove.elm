module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail : { url : String } -> Html msg
viewThumbnail thumbnail =
    img [ src (urlPrefix ++ thumbnail.url) ] []


view : List { url : String } -> Html msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ] (List.map viewThumbnail model)
        ]


initialModel : List { url : String }
initialModel =
    [ { url = "1.jpeg" }
    , { url = "2.jpeg" }
    , { url = "3.jpeg" }
    ]


main : Html msg
main =
    view initialModel
