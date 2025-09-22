import qualified Data.Set as Set

-- Recursive character counter
countChar :: Char -> String -> Int
countChar _ [] = 0
countChar charGiven (firstChar:restOfTheChars)
    | charGiven == firstChar = 1 + countChar charGiven restOfTheChars
    | otherwise = countChar charGiven restOfTheChars

countCharInStrings :: Char -> [String] -> Int
countCharInStrings _ [] = 0
countCharInStrings char (firstString:restOfTheStrings) = countChar char firstString + countCharInStrings char restOfTheStrings


-- Higher order function
dubbleCharCount :: (Int -> Int) -> Int -> Int
dubbleCharCount f x = f x

numberTimesTwo :: Int -> Int
numberTimesTwo x = x * 2


-- Higher order function

uniqueCount :: [String] -> Int
uniqueCount = Set.size . Set.fromList

analyzeText :: String -> Char -> IO ()
analyzeText txt charToAnalyze = do
    let wordList = words txt
    let uniqueWordsCount = uniqueCount wordList
    let wordCount = length wordList
    let charCount = length txt
    let uniqueCharCount = countCharInStrings charToAnalyze wordList
    let dubbleCharCountResult = dubbleCharCount numberTimesTwo charCount

    putStrLn $ "Your text: " ++ unwords wordList
    putStrLn ("How many characters: " ++ show charCount)
    putStrLn ("How many words: " ++ show wordCount)
    putStrLn ("How many unique words: " ++ show uniqueWordsCount)
    putStrLn ("How many times is the letter a used: " ++ show uniqueCharCount)
    putStrLn ("Dubble char count result: " ++ show dubbleCharCountResult)

main :: IO ()
main = do
    contents <- readFile "example.txt"
    putStrLn "Add a character to check how many times it occors in the text"
    charToAnalyze <- getChar
    analyzeText contents charToAnalyze

