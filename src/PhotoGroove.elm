module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array exposing (..)


type alias Photo =
    { url : String }


photoArray : Array Photo
photoArray =
    Array.fromList initialModel.photos


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


type alias Msg =
    { data : String, operation : String }


viewThumbnail : String -> Photo -> Html Msg
viewThumbnail selectedUrl thumbnail =
    img
        [ src (urlPrefix ++ thumbnail.url)
        , classList [ ( "selected", selectedUrl == thumbnail.url ) ]
        , onClick { operation = "SELECT_PHOTO", data = thumbnail.url }
        ]
        []


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , button
            [ onClick { operation = "SURPRISE_ME", data = "" } ]
            [ text "Surprise Me" ]
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


type alias Model =
    { photos : List Photo, selectedUrl : String }


initialModel : Model
initialModel =
    { photos =
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "1.jpeg"
    }


update : Msg -> Model -> Model
update msg model =
    case msg.operation of
        "SELECT_PHOTO" ->
            { model | selectedUrl = msg.data }

        "SURPRISE_ME" ->
            { model | selectedUrl = "2.jpeg" }

        _ ->
            model


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
