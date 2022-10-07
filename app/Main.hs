--
-- EPITECH PROJECT, 2022
-- wolfram
-- File description:
-- main
--

import System.Environment ( getArgs )
import Data.Maybe (isNothing, fromJust)
import System.Exit (exitWith, ExitCode (ExitFailure), exitFailure)
import Parser (parser)
import Exec (launchWolfram) 

wolframOptions :: [ Maybe Int ]
wolframOptions = [Nothing, Just 0, Just (-1), Just 80, Just 0]

wolfram :: [ String ] -> IO ()
wolfram x | isNothing (parser x wolframOptions) = exitWith (ExitFailure 84)
wolfram x = launchWolfram (fromJust (parser x wolframOptions))

main :: IO ()
main = getArgs >>= wolfram