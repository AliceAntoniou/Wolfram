--
-- EPITECH PROJECT, 2022
-- wolfram
-- File description:
-- Print
--

module Print where
import System.Exit (exitWith, ExitCode (ExitFailure))

boolToStar :: Bool -> Char
boolToStar True = '*'
boolToStar False = ' '

printWolfram :: [ Int ] -> [ Bool ] -> IO ()
printWolfram [w, m] line = putStrLn (take w (drop m (map boolToStar line)))
printWolfram _ _ = exitWith (ExitFailure 84)