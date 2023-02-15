module Main where

import qualified Hello
import Foo.Bar
import System.Random (randomRIO)

main :: IO()
main = do
    putStrLn "Qual seu nome?" 
    name <- getLine
    Hello.hello name
    Hello.hello world
    n <- randomRIO (1,5) :: IO Int
    let while = do
            putStr "Tente Acertar o Número: "
            x <- readLn :: IO Int
            if x == n 
                then putStrLn "Arcetou mizeravi"
                else do
                    putStrLn "Burrão, mané!"
                    while
    while

