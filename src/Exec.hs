--
-- EPITECH PROJECT, 2022
-- wolfram
-- File description:
-- Exec
--

module Exec where
import System.Exit (exitWith, ExitCode (ExitFailure))
import Rule (execRule, getRule)
import Print (printWolfram)

launchWolfram:: [ Int ] -> IO ()
launchWolfram [rule_nbr, start, lines, window, move] = execWolfram [start, lines, window, -min 0 ((window `div` 2) + move)] (getRule rule_nbr) (replicate ((window `div` 2) + move) False ++ [True] ++ replicate ((window `div` 2) - move) False)
launchWolfram _ = exitWith (ExitFailure 84)

nextLine :: [ Bool ] -> [ Bool ] -> [ Bool ]
nextLine rule (left:middle:right:xs) = execRule rule [left, middle, right]:nextLine rule (middle:right:xs)
nextLine _ [_, end] = [end]
nextLine _ _ = []

execWolfram :: [ Int ] -> [ Bool ] -> [ Bool ] -> IO ()
execWolfram [start, 1, window, left] _ line = printWolfram [window, left] line
execWolfram [0, lines_to_print, window, left] rule (x:xs) = printWolfram [window, left] (x:xs) >>
                                                            execWolfram [0, lines_to_print - 1, window, left + 1] rule (x:nextLine rule (False:x:xs ++ [False]))
execWolfram [start, lines_to_print, window, left] rule (x:xs) = execWolfram [start - 1, lines_to_print, window, left + 1] rule
                                    (x:nextLine rule (False:x:xs ++ [False]))
execWolfram _ _ _ = exitWith (ExitFailure 84)