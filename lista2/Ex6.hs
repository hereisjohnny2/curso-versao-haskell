module Ex6 where

data TriDu = Dupla Int | Tripla Int | Nada deriving (Show)

montaJogo :: [Int] -> TriDu
montaJogo (x : y : z : _)
  | x == y && x == z = Tripla x
  | x == z = Dupla x
  | y == z = Dupla y
montaJogo _ = Nada

verificaVencedor :: TriDu -> TriDu -> Int
verificaVencedor (Tripla _) (Dupla _) = 0
verificaVencedor (Dupla _) (Tripla _) = 1
verificaVencedor (Tripla x) (Tripla y)
  | x > y = 0
  | x < y = 1
  | x == y = -1
verificaVencedor (Dupla x) (Dupla y)
  | x > y = 0
  | x < y = 1
  | x == y = -1
verificaVencedor _ _ = -1

main :: IO ()
main = do
  l1 <- words <$> getLine
  l2 <- words <$> getLine
  let a = montaJogo $ map (\x -> read x :: Int) l1
  let b = montaJogo $ map (\x -> read x :: Int) l2
  case verificaVencedor a b of
    -1 -> putStrLn "E"
    0 -> putStrLn "A"
    1 -> putStrLn "B"
