module Ex2 where

import Control.Monad (foldM, forM_)
import Text.Read (readMaybe)

data Moeda = Moeda {nome :: String, valor :: Float} deriving (Show)

readMaybeLine :: Read a => IO (Maybe a)
readMaybeLine = readMaybe <$> getLine

safeRead :: Read a => String -> IO a
safeRead info = do
  putStr info
  mx <- readMaybeLine
  case mx of
    Just x -> return x
    Nothing -> do
      putStrLn "Valor invalido, tente novamente!"
      safeRead info

lerMoedas :: [Moeda] -> Int -> IO [Moeda]
lerMoedas acc x = do
  l <- words <$> getLine
  case l of
    [] -> do
      putStrLn "Valor inválido, tente novamente!"
      lerMoedas acc x
    [_] -> do
      putStrLn "Valor inválido, tente novamente!"
      lerMoedas acc x
    nome : taxa : xs -> do
      let mtaxa = readMaybe taxa :: Maybe Float
      case mtaxa of
        Just taxa -> return $ acc ++ [Moeda nome taxa]
        Nothing -> do
          putStrLn "Valor inválido, tente novamente!"
          lerMoedas acc x

arredondarDecimal :: Float -> Float -> Float
arredondarDecimal x n = fromIntegral (round $ x * n) / n

main :: IO ()
main = do
  n <- safeRead "Número de Moedas: " :: IO Int
  lista <- foldM lerMoedas [] [1 .. n]
  valor <- safeRead "Valor a ser Convertido: " :: IO Float
  let saida = map (\(Moeda nome taxa) -> Moeda nome $ arredondarDecimal (valor * 100 / taxa) 1e2) lista
  forM_ [1 .. n] $ \x -> do
    print $ saida !! (x - 1)
