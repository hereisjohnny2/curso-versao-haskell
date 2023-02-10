module Test where

primeiro :: [Int] -> Int
primeiro (x : _) = x

ultimo :: [Int] -> Int
ultimo [x] = x
ultimo (_ : x) = ultimo x

tamanho :: [Int] -> Int
tamanho [] = 0
tamanho (_ : x) = 1 + tamanho x

