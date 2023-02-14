module ReadUntilWorks where
import Text.Read (readMaybe)

readMaybeLine :: Read a => IO (Maybe a)
readMaybeLine = readMaybe <$> getLine

checkBiggerThan10 :: Int -> Maybe Int
checkBiggerThan10 x = if x > 10 then Nothing else Just x

readUntil :: IO Int
readUntil = do
    putStrLn "Enter a value:"
    mx <- readMaybeLine :: IO (Maybe Int)
    case mx of
        Just x -> case checkBiggerThan10 x of 
            Just x -> return x
            Nothing -> do 
                putStrLn "Value is greater than 10, try again!"
                readUntil
        Nothing -> do 
            putStrLn "Invalid Value, try again!"
            readUntil

main :: IO()
main = do
    x <- readUntil
    print x
