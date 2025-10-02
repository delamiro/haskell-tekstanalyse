import Data.List (nub)

countCharInString :: Char -> String -> Int
countCharInString c = length . filter (== c)

countCharInStringList :: Char -> [String] -> Int
countCharInStringList c = sum . map (countCharInString c)

countUniqueWords :: [String] -> Int
countUniqueWords = length . nub

analyzeText :: String -> Char -> IO ()
analyzeText txt ch = do
    let filename = "analysis.txt"
        ws = words txt
        content = unlines
            [ "Your text: " ++ unwords ws
            , "How many characters: " ++ show (length txt)
            , "How many words: " ++ show (length ws)
            , "How many unique words: " ++ show (countUniqueWords ws)
            , "How many times is the letter " ++ [ch] ++ " used: " ++ show (countCharInStringList ch ws)
            ]
    writeFile filename content
    putStrLn $ "File '" ++ filename ++ "' has been created."

main :: IO ()
main = do
    contents <- readFile "textToAnalyse.txt"
    putStrLn "Add a character to check how many times it occurs in the text"
    charToAnalyze <- getChar
    analyzeText contents charToAnalyze