module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail : String -> { a | url : String } -> Html msg
viewThumbnail selectedUrl thumbnail =
    if selectedUrl == thumbnail.url then
        img
            [ src (urlPrefix ++ thumbnail.url)
            , class "selected"
            ]
            []
    else
        img [ src (urlPrefix ++ thumbnail.url) ] []


view : { photos : List { url : String }, selectedUrl : String } -> Html msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map (\photo -> viewThumbnail model.selectedUrl photo)
                model.photos
            )
        ]


initialModel : { photos : List { url : String }, selectedUrl : String }
initialModel =
    { photos =
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "1.jpeg"
    }


main : Html msg
main =
    view initialModel
