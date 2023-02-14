module Aula4 where

reverse' :: String -> String
reverse' [] = [] 
reverse' (x:xs) = reverse' xs ++ [x] 

