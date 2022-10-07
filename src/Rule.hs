--
-- EPITECH PROJECT, 2022
-- wolfram
-- File description:
-- Rule
--

module Rule where
import Data.Bits ( Bits((.&.), shiftR) )

nBitToBin :: Int -> Int -> [ Bool ]
nBitToBin _ 0 = []
nBitToBin i n = nBitToBin (shiftR i 1) (n - 1) ++ [i .&. 1 == 1]

getRule :: Int -> [ Bool ]
getRule i = nBitToBin i 8

execRule :: [ Bool ] -> [ Bool ] -> Bool
execRule (True:_) [True, True, True] = True
execRule (_:True:_) [True, True, False] = True
execRule (_:_:True:_) [True, False, True] = True
execRule (_:_:_:True:_) [True, False, False] = True
execRule (_:_:_:_:True:_) [False, True, True] = True
execRule (_:_:_:_:_:True:_) [False, True, False] = True
execRule (_:_:_:_:_:_:True:_) [False, False, True] = True
execRule (_:_:_:_:_:_:_:True:_) [False, False, False] = True
execRule _ _ = False