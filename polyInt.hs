module PolyInt where
import Text.Read (readMaybe)

readMaybeLine :: Read a => IO (Maybe a)
readMaybeLine = readMaybe <$> getLine

readUntil :: String -> IO Float
readUntil a = do
    putStrLn a
    mx <- readMaybeLine :: IO (Maybe Float)
    case mx of
        Just x -> return x
        Nothing -> do 
            putStrLn "Value must be a number, try again!"
            readUntil a

data Integrator = Integrator { n ::Float, ll::Float, ul::Float } deriving Show
data PolyFunction = PolyFunction { a::Float, b::Float, c::Float } deriving Show

f :: Float -> PolyFunction -> Float
f x (PolyFunction a b c)= a*x**2 + b*x + c

calculateArea :: Integrator -> PolyFunction -> Float
calculateArea (Integrator n ll ul) pf = ((f ll pf + f ul pf)/2 + foldr (\x acc -> acc + f x pf) 0 [1..(n-1)]) * (ul - ll)/n

main :: IO()
main = do
    n  <- readUntil "Enter the number of points: "
    ll <- readUntil "Enter the lower limit: "
    ul <- readUntil "Enter the upper limit: "
    a  <- readUntil "Enter the coefficinte A of the polinomial function f(x) = ax**2+bx+c: "
    b  <- readUntil "Enter the coefficinte B of the polinomial function f(x) = ax**2+bx+c: "
    c  <- readUntil "Enter the coefficinte C of the polinomial function f(x) = ax**2+bx+c: "
    print $ calculateArea (Integrator n ll ul) (PolyFunction a b c)
