module Questao9a where

-- Para construir um foguete, e ir até a lua, são necessários vários componentes, quanto mais componentes, mais combustivel é necessário para realizar a viagem. Para calcular quanto combustível é necessario para cada componente você divide o peso do componente por 3 e aredonda o valor para baixo (número inteiro) e depois subtrai 2, por exemplo, para um componente que pesa 13 quilos, será necessário 2 kilos de combustível. Faça um programa que leia um arquivo de nome "componentes.txt" no mesmo dirétorio de execução do programa e calcule o total de combustível necessario para realizar a viagem. O arquivo "componentes.txt" possui varias linhas, cada linha possui apenas um número inteiro relativo ao peso de um componente que está no foguete.

import Text.Read (readMaybe)

stringToInt :: String -> Maybe Int
stringToInt = readMaybe

calcularPeso :: Maybe Int -> Int
calcularPeso Nothing = 0
calcularPeso (Just x) = (x `div` 3) - 2

main :: IO ()
main = do
  xs <- readFile "componentes.txt"
  let pesoTotal = foldr ((+) . calcularPeso . stringToInt) 0 (lines xs)
  print pesoTotal

