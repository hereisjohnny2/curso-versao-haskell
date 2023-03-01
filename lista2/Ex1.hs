module Ex1 where

verificarSibilancia :: String -> String
verificarSibilancia [] = "N"
verificarSibilancia [x] = "N"
verificarSibilancia (x1 : x2 : xs) = if x1 == 's' && x2 == 's' then "S" else verificarSibilancia (x2 : xs)

main :: IO ()
main = do
  i <- getLine
  putStrLn $ verificarSibilancia i
