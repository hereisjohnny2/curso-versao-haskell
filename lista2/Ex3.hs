module Ex3 where 
import Control.Monad (foldM)
import Text.Read (readMaybe)

safeRead :: Read a => String -> IO a
safeRead info = do
  putStr info
  mx <- readMaybe <$> getLine 
  case mx of
    Just x -> return x
    Nothing -> do
      putStrLn "Valor invalido, tente novamente!"
      safeRead info

ehValida :: String -> String
ehValida [_] = "falso"
ehValida xs = aux xs 0
  where
    aux [] 0 = "verdadeiro"
    aux (y:ys) n 
      | n < 0 = "falso"
      | y == '(' = aux ys (n+1)
      | y == ')' = aux ys (n-1)
      | otherwise = "falso"

main :: IO ()
main = do
  n <- safeRead "Numero de Casos de Testes: " :: IO Int
  entrada <- foldM (\acc _ -> do
      l <- getLine
      return $ acc ++ [ehValida l]
    ) [] [1 .. n]
  print entrada

