module Lista2 where

-- 1. Crie um tipo Dia contendo os dias da semana. Faça uma função que receba uma lista de Dias e filtre as Terças.
data Dia = Segunda
         | Terca
         | Quarta
         | Quinta
         | Sexta
         | Sabado
         | Domingo
    deriving (Show, Eq)

removeTerca :: [Dia] -> [Dia]
removeTerca xs = [x | x <- xs, x /= Terca]

-- 2. Implemente uma função que receba uma lista de inteiros e retorne o dobro de todos, eliminando os múltiplos de 4.
dobraRemoveMult4 :: [Int] -> [Int]
dobraRemoveMult4 xs = [x | x <- map (*2) xs, mod x 4 /= 0]

-- 3. Crie o tipo TipoProduto que possui os values constructors Escritorio , Informatica , Livro ,
-- Filme e Total . O tipo Produto possui um value constructor - de mesmo nome - e os campos
-- valor ( Double ), tp ( TipoProduto ) e um value constructor Nada , que representa a
-- ausência de um Produto .
data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving Show
data Produto = Produto { valor::Double, tp::TipoProduto } | Nada deriving Show

-- Deseja-se calcular o valor total de uma compra, de modo a não ter nenhuma conversão
-- para inteiro e de forma combinável. Crie uma instância de monoide para Produto, de modo
-- que o retorno sempre tenha Total no campo tp e a soma dos dois produtos em valor.
instance Semigroup Produto where
    (Produto v1 _) <> (Produto v2 _) = Produto (v1+v2) Total
instance Monoid Produto where
    mempty = Nada 

-- 4. Escreva uma instância de Functor para o tipo data Fantasma a = Fantasma.
data Fantasma a = Fantasma deriving Show
instance Functor Fantasma where
    fmap _ _ = Fantasma 

-- 5. Escreva uma possível instância de Functor para o tipo data Dupla a = Dupla a Int a.
data Dupla a = Dupla a Int a deriving Show
instance Functor Dupla where 
    fmap f (Dupla x y z) = Dupla (f x) y (f z)

-- -- 6. Escreva uma instancia de Functor applicative para o tipo data Dupla a = Dupla a Int a.
-- instance Applicative Dupla where
--     pure x = (flip Dupla) ::Int x x
--     (Dupla f1 _ f3) <*> (Dupla x y z) = Dupla (f1 x) y (f3 z)

-- 7.  É possível criar uma instância de Functor para o tipo Bar a = Bar {runBar :: Bool -> a}?
--  Justifique e, em caso positivo, crie a instância de Functor e Applicative. 
newtype Bar a = Bar {runBar::Bool -> a}
instance Functor Bar where
    fmap f (Bar runBar) = Bar (f . runBar)

-- instance Applicative Bar where
--     (Bar f) <*> (Bar x) = Bar (f . runBar)
