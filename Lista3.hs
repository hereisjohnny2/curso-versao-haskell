module Lista3 where

-- 1. Construa o list comprehension que gere:
-- a) [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
lista1A = [x * 5 | x <- [0..10]]
-- b) Uma lista de 'a' a 'z' sem as vogais.
lista1B = [x | x <- ['a'..'z'], x `notElem` ['a', 'e', 'i', 'o', 'u']]
-- c) uma lista de 0 a 50 sem os números 2, 7, 13, 35 e 42.
lista1C = [x | x <- [0 .. 50], x `notElem` [2, 7, 13, 35, 42]]
-- d) [500.0, 250.0, 125.0, 62.5, 31.25, 15.625, 7.8125, 3.90625, 1.953125, 0.9765625]
lista1D = [500/(2**x) | x <- [0 .. 9]]
-- e) uma lista com todas as coordenadas de um tabuleiro de damas 8x8 ([('a',1), ('a',2), ('a',3) ... ('h',7), ('h',8)]).
lista1E = [(x, y) | x <- ['a' .. 'h'], y <- [1 .. 8]]

