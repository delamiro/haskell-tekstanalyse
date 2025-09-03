import qualified Data.Set as Set

uniqueCount :: [String] -> Int
uniqueCount = Set.size . Set.fromList

analyzeText :: String -> IO ()
analyzeText txt = do
    let wordList = words txt
    let uniqueWordsCount = uniqueCount wordList
    let wordCount = length wordList
    let charCount = length txt

    putStrLn $ "Your text: " ++ unwords wordList
    putStrLn ("How many characters: " ++ show charCount)
    putStrLn ("How many words: " ++ show wordCount)
    putStrLn ("How many unique words: " ++ show uniqueWordsCount)

main :: IO ()
main = do
    putStrLn "Add text here to analyze"
    bigTextStr <- getLine
    analyzeText bigTextStr

