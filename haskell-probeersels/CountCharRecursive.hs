countChar :: Char -> String -> Int
countChar _ [] = 0
countChar c (x:xs)
    | c == x    = 1 + countChar c xs
    | otherwise = countChar c xs

main :: IO ()
main = do
    print (countChar 'a' "banana") 