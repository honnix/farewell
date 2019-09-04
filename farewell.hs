module Main (main) where

import System.Environment (getArgs)
import Text.Regex (mkRegex, subRegex, splitRegex)
import Data.Char (ord, chr)
import Data.Bits (xor)

decrypt _ _ [] decrypted = decrypted
decrypt key index encrypted decrypted = decrypt key (index + 1) (tail encrypted)
    (decrypted ++ [chr (xor (read (head encrypted) :: Int) (ord (key !! (mod index (length key)))))])

main = do
  [f] <- getArgs
  content <- readFile f
  let encrypted = splitRegex (mkRegex ",") (subRegex (mkRegex "[\n\r\t ]") content "")
  let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"
  putStr (decrypt key 0 encrypted [])
