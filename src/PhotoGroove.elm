module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail : String -> { a | url : String } -> Html { data : String, operation : String }
viewThumbnail selectedUrl thumbnail =
    img
        [ src (urlPrefix ++ thumbnail.url)
        , classList [ ( "selected", selectedUrl == thumbnail.url ) ]
        , onClick { operation = "SELECT_PHOTO", data = thumbnail.url }
        ]
        []


view : { photos : List { url : String }, selectedUrl : String } -> Html { data : String, operation : String }
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map (viewThumbnail model.selectedUrl)
                model.photos
            )
        , img
            [ class "large"
            , src (urlPrefix ++ "large/" ++ model.selectedUrl)
            ]
            []
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


update :
    { b | data : a, operation : String }
    -> { c | selectedUrl : a }
    -> { c | selectedUrl : a }
update msg model =
    if msg.operation == "SELECT_PHOTO" then
        { model | selectedUrl = msg.data }
    else
        model


main : Program Never { photos : List { url : String }, selectedUrl : String } { data : String, operation : String }
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
