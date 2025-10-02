countCharInString :: Char -> String -> Int
countCharInString _ [] = 0
countCharInString c (x:xs)
    | c == x    = 1 + countCharInString c xs
    | otherwise = countCharInString c xs

countCharInStringList :: Char -> [String] -> Int
countCharInStringList _ [] = 0
countCharInStringList c (s:ss) = countCharInString c s + countCharInStringList c ss

countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (firstWord:restOfTheWords)
    | firstWord `elem` restOfTheWords = countUniqueWords restOfTheWords
    | otherwise = 1 + countUniqueWords restOfTheWords

analyzeText :: String -> Char -> IO ()
analyzeText txt ch = do
    let filename = "analysis.txt"
        content = unlines
            [ "Your text: " ++ unwords (words txt)
            , "How many characters: " ++ show (length txt)
            , "How many words: " ++ show (length (words txt))
            , "How many unique words: " ++ show (countUniqueWords (words txt))
            , "How many times is the letter " ++ [ch] ++ " used: " ++ show (countCharInStringList ch (words txt))
            ]
    writeFile filename content
    putStrLn $ "File '" ++ filename ++ "' has been created."

main :: IO ()
main = do
    contents <- readFile "textToAnalyse.txt"
    putStrLn "Add a character to check how many times it occors in the text"
    charToAnalyze <- getChar
    analyzeText contents charToAnalyze