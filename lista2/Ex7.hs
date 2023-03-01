module Ex7 where

import Control.Monad (foldM)

charsACorrigir :: [String] -> Int
charsACorrigir ((x : xs) : (y : ys) : _)
  | x /= y = 1 + charsACorrigir [xs, ys]
  | otherwise = charsACorrigir [xs, ys]
charsACorrigir _ = 0

main :: IO ()
main = do
  n <- readLn :: IO Int
  frases <-
    foldM
      ( \acc _ -> do
          l <- words <$> getLine
          return $ acc ++ [l]
      )
      []
      [1 .. n]
  print $ map charsACorrigir frases
