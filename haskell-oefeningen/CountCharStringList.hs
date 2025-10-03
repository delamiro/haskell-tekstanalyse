countChar :: Char -> String -> Int
countChar _ [] = 0
countChar charGiven (firstChar:restOfTheChars)
    | charGiven == firstChar = 1 + countChar charGiven restOfTheChars
    | otherwise = countChar charGiven restOfTheChars


countCharInStrings :: Char -> [String] -> Int
countCharInStrings _ [] = 0
countCharInStrings char (firstString:restOfTheStrings) = countChar char firstString + countCharInStrings char restOfTheStrings



main :: IO ()
main = do
    print (countCharInStrings 'a' ["banana", "apple", "chat"])     -- list of strings

