module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, div, h1, img, input, text)
import Html.Attributes exposing (src, type_, value)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 1, Cmd.none )



---- UPDATE ----


type Msg
    = InputNumber String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InputNumber inp ->
            case String.toInt inp of
                Just inpNum ->
                    ( inpNum, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )



---- VIEW ----


fizzbuzz : Int -> String
fizzbuzz num =
    case ( modBy 3 num, modBy 5 num ) of
        ( 0, 0 ) ->
            "FizzBuzz"

        ( 0, _ ) ->
            "Fizz"

        ( _, 0 ) ->
            "Buzz"

        _ ->
            String.fromInt num


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "number", value <| String.fromInt model, onInput InputNumber ] []
        , h1 [] [ text <| fizzbuzz model ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
