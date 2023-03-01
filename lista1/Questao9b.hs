module Questao9b where

-- O programa anterior tem um problema, ele considera apenas o peso dos componentes, porém, é necessário considerar quanto de combustível é necessario para lear o combusti´vel de cada componente. Para isso é necessário calcular quantos quilos de combustível é necessário para um componente, e depois qualquer quanto de combustivel é necessário para o combustivel que foi calculado, e fazer sucessivamente até que não seja mais necessário adicionar mais combustivel. Faça um programa igual ao anterior, mas considere essa informação que foi passada para alterar o calculo de combustível.

import Text.Read (readMaybe)

stringToInt :: String -> Maybe Int
stringToInt = readMaybe

calcularPeso :: Maybe Int -> Int
calcularPeso Nothing = 0
calcularPeso (Just x)
  | x < 6 = 0
  | otherwise = peso + calcularPeso (Just peso) where peso = (x `div` 3) - 2

main :: IO ()
main = do
  xs <- readFile "componentes.txt"
  let pesoTotal = foldr ((+) . calcularPeso . stringToInt) 0 (lines xs)
  print pesoTotal
