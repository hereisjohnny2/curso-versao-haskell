module ReadUntilWorks where
import Text.Read (readMaybe)

readMaybeLine :: Read a => IO (Maybe a)
readMaybeLine = readMaybe <$> getLine

readUntil :: IO Int
readUntil = do
    putStrLn "Enter a value:"
    mx <- readMaybeLine :: IO (Maybe Int)
    case mx of
        Just x -> if x > 100
            then return x
            else do
                putStrLn "Value should be greater than 100, try again!"
                readUntil
        Nothing -> do 
            putStrLn "Invalid Value, try again!"
            readUntil

main :: IO()
main = do
    x <- readUntil
    print x
