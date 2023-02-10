module Lista1 where

-- Helpers
(|>) = flip ($)

-- 1. Gere as seguintes listas:
-- a. [1,11,121,1331,14641,161051,1771561]
lista1a = [11**i | i<-[0..6]]
-- b. [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]
lista1b = [i | i<-[1..39], i `mod` 4 /= 0]
-- c. ["AaBB","AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"]
lista1c = ['A':c:"BB" | c<-['a'..'f']]

-- 2. Crie uma função que verifique se o tamanho de uma String é par ou não. Use Bool como retorno.
temTamanhoPar :: [Char] -> Bool
temTamanhoPar xs = xs |> length |> even

-- 3. Escreva uma função que receba um vetor de Strings e retorne uma lista com o tamanho de
--    cada String. As palavras de tamanho par devem ser excluídas da resposta.
compPalavrasImpar :: [String] -> [Int]
compPalavrasImpar xs = xs |> map length |> filter odd

-- 4. Escreva a função head como composição de duas outras.
head' = flip (!!) 0

-- 5. Crie o tipo Pergunta com os values constructors Sim ou Nao. Faça as funções seguintes, determinando seus tipos explicitamente.
data Pergunta = Sim | Nao
-- pergNum : recebe via parâmetro uma Pergunta . Retorna 0 para Nao e 1 para Sim.
pergNum :: Pergunta -> Int
pergNum Nao = 0
pergNum Sim = 1
-- listPergs : recebe via parâmetro uma lista de Perguntas, e retorna 0s e 1s correspondentes aos constructores contidos na lista.
listPergs :: [Pergunta] -> [Int]
listPergs xs = xs |> map pergNum
-- and' : recebe duas Perguntas como parâmetro e retorna a tabela verdade do and lógico, usando Sim como verdadeiro e Nao como falso.
and' :: Pergunta -> Pergunta -> Bool
and' Sim Sim = True 
and' _ _ = False
-- or' : idem ao anterior, porém deve ser usado o ou lógico.
or' :: Pergunta -> Pergunta -> Bool
or' Nao Nao = False
or' _ _ = True 
-- not' : idem aos anteriores, porém usando o not lógico.
not' :: Pergunta -> Bool
not' Sim = False
not' Nao = True
