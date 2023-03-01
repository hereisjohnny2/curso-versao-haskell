module Ex5 where

main :: IO ()
main = do
  l1 <- words <$> getLine
  l1 <- return $ map (\x -> read x :: Float) l1
  l2 <- words <$> getLine
  l2 <- return $ map (\x -> read x :: Float) l2
  print $ ceiling $ sum l2 / (l1 !! 1)
  
