--
-- EPITECH PROJECT, 2022
-- wolfram
-- File description:
-- parse
--

module Parser where
import System.Exit ( ExitCode(ExitFailure), exitWith)
import Text.Read (readMaybe)
import Data.Maybe (isNothing, fromJust)

_rule :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
_rule (x:xs) (_:is) = parse xs (readMaybe x:is)
_rule _ i = i

_start :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
_start (x:xs) (a:_:is) = parse xs (a:readMaybe x:is)
_start _ i = i

_lines :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
_lines (x:xs) (a:b:_:is) = parse xs (a:b:readMaybe x:is)
_lines _ i = i

_window :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
_window (x:xs) (a:b:c:_:is) = parse xs (a:b:c:readMaybe x:is)
_window _ i = i

_move :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
_move (x:xs) (a:b:c:d:_:is) = parse xs (a:b:c:d:readMaybe x:is)
_move _ i = i

parse :: [ String ] -> [ Maybe Int ] -> [ Maybe Int ]
parse ("--rule":xs) param = _rule xs param
parse ("--start":xs) param = _start xs param
parse ("--lines":xs) param = _lines xs param
parse ("--window":xs) param = _window xs param
parse ("--move":xs) param = _move xs param
parse [] param = param
parse _ param = param

checkParse :: [ Maybe Int ] -> Bool
checkParse param | any isNothing param = False
checkParse (rule:ix) | rule > Just 255 || rule < Just 0 = False
checkParse (rule:start:ix) | start < Just 0 = False
checkParse (rule:start:lines:ix) | lines < Just (-1) = False
checkParse (rule:start:c:d:ix) | d < Just 0 = False
checkParse _ = True

parser :: [ String ] -> [ Maybe Int ] -> Maybe [ Int ]
parser args param_array | not (checkParse (parse args param_array)) = Nothing
parser args param_array = Just (map fromJust (parse args param_array))
