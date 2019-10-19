module Model exposing (..)

import Browser.Dom exposing (Error, Viewport)
import Debounce exposing (Debounce)
import InfiniteList
import Ipc exposing (AllianceStation, Mode, RobotState)

type alias Model =
    { teamNumber : String
    , debounce : Debounce Int
    , enabled : Bool
    , mode : Mode
    , alliance : AllianceStation
    , stdout : List String
    , stdoutList : InfiniteList.Model
    , listScrollBottom : Float
    , robotState : RobotState
    , activePage : ActivePage
    , explaining : Maybe ErrorExplanation
    , estopped : Bool
    }

type ActivePage
    = Control
    | Config

type ErrorExplanation
    = Comms
    | Code
    | Joysticks

type Msg
    = EnableChange Bool
    | ModeChange Mode
    | TeamNumberChange String
    | BackendMessage Ipc.IpcMsg
    | Debounced Debounce.Msg
    | InfiniteListMsg InfiniteList.Model
    | ChangePage ActivePage
    | GlobalKeyboardEvent Int
    | SideViewChange (Maybe ErrorExplanation)
    | Nop
