-- module Ex4 where
module Ex4 where

import Control.Monad (foldM)
import Data.List (transpose)

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

verificaElementosUnicos :: Eq a => [a] -> Bool
verificaElementosUnicos [] = True
verificaElementosUnicos (x:xs) =  notElem x xs && verificaElementosUnicos xs

ehSolucaoValida :: [[Int]] -> Bool
ehSolucaoValida tabuleiro = verificaElementosUnicos tabuleiro &&
                            verificaElementosUnicos colunas &&
                            verificaElementosUnicos blocos
  where
    colunas = transpose tabuleiro
    blocos = concatMap (chunksOf 3) $ map concat $ chunksOf 3 tabuleiro


main :: IO ()
main = do
  tabuleiro <-
    foldM
      ( \acc x -> do
          l <- words <$> getLine
          l <- return $ map (\x -> read x :: Int) l
          return $ acc ++ [l]
      )
      []
      [1 .. 9]
  print $ ehSolucaoValida tabuleiro 
