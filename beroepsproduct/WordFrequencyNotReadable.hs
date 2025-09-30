countChar :: Char -> String -> Int
countChar _ [] = 0
countChar c (s:xs)
    | c == s = 1 + countChar c xs
    | otherwise = countChar c xs

-- Unique word counter using 

countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (x:xs)
    | x `elem` xs = countUniqueWords xs
    | otherwise = 1 + countUniqueWords xs

countCharInStrings :: Char -> [String] -> Int
countCharInStrings _ [] = 0
countCharInStrings c (s:ss) = countChar c s + countCharInStrings c ss

analyzeText :: String -> Char -> IO ()
analyzeText txt charToAnalyze = do
    let wordList = words txt
    let uniqueWordsCount = countUniqueWords wordList
    let wordCount = length wordList
    let charCount = length txt
    let uniqueCharCount = countCharInStrings charToAnalyze wordList


    putStrLn $ "Your text: " ++ unwords wordList
    putStrLn ("How many characters: " ++ show charCount)
    putStrLn ("How many words: " ++ show wordCount)
    putStrLn ("How many unique words: " ++ show uniqueWordsCount)
    putStrLn ("How many times is the letter a used: " ++ show uniqueCharCount)

main :: IO ()
main = do
    putStrLn "Add text here to analyze"
    bigTextStr <- getLine
    putStrLn "Add a character to check how many times it occors in the text"
    charToAnalyze <- getChar
    analyzeText bigTextStr charToAnalyze

