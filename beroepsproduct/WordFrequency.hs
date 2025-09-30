-- Recursive character counter
-- Deze functies tellen op hoevaak een specifiek character word gebruikt in een string list
-- Eerst word countCharInStringList aangeroepen vervolgens word countCharInString aanroepen voor iedere string
-- countCharInString is een recursive functie omdat na ieder character zichzelf aanroept voor de rest van de caracters
countCharInString :: Char -> String -> Int
countCharInString _ [] = 0
countCharInString charGiven (firstChar:restOfTheChars)
    | charGiven == firstChar = 1 + countCharInString charGiven restOfTheChars
    | otherwise = countCharInString charGiven restOfTheChars

countCharInStringList :: Char -> [String] -> Int
countCharInStringList _ [] = 0
countCharInStringList char (firstString:restOfTheStrings) = countCharInString char firstString + countCharInStringList char restOfTheStrings


-- Higher order function
-- Deze functies zijn eigenlijk vrij onnodig
-- Ik kon voor deze opdracht niet iets verzinnen hoe ik higher-order-functions goed en nodig kon toepassen
-- Toch om te laten zien dat ik hof snap heb ik dit verzonnen
-- een functie die als parameter een functie nodig heeft en een int die het dubbelen van de int paramater terug geeft
-- Ik snap zelf ook wel dat als ik zo iets nodig had dat ik dit of in 1 functie kon doen of zelfs inline

doubleCharCount :: (Int -> Int) -> Int -> Int
doubleCharCount f x = f x

multiplyByTwo :: Int -> Int
multiplyByTwo x = x * 2

-- Unique word counter 
-- Pakt een List met strings en returned hoeveel unique woorden in de list zitten
-- Hij pakt het eerste woord en kijkt of deze vaker in de lijst voorkomt
-- Als hij wel in de lijst voorkomt telt hij niks op
-- Zo niet dan telt hij + 1
-- Deze functie is recursief
countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (firstWord:restOfTheWords)
    | firstWord `elem` restOfTheWords = countUniqueWords restOfTheWords
    | otherwise = 1 + countUniqueWords restOfTheWords

-- Analyze text
-- Dit is 1 grote functie die de tekst analyseerd door middel van andere functies
-- De reden waarom dit een IO () functie is omdat het side effects heeft
-- Een side effect is iets wat een functie doet buiten het alleen berekenen van een waarde
-- putStlLn is bijvoorbeeld een side effect, ook een file aanmaken is een side effect
-- Dit is dus ook geen PURE functie
analyzeText :: String -> Char -> IO ()
analyzeText txt charToAnalyze = do
    let wordList = words txt
    let uniqueWordsCount = countUniqueWords wordList
    let wordCount = length wordList
    let charCount = length txt
    let uniqueCharCount = countCharInStringList charToAnalyze wordList
    let dubbleCharCountResult = doubleCharCount multiplyByTwo charCount

    putStrLn $ "Your text: " ++ unwords wordList
    putStrLn ("How many characters: " ++ show charCount)
    putStrLn ("How many words: " ++ show wordCount)
    putStrLn ("How many unique words: " ++ show uniqueWordsCount)
    putStrLn ("How many times is the letter a used: " ++ show uniqueCharCount)
    putStrLn ("Dubble char count result: " ++ show dubbleCharCountResult)

    let filename = "analysis.txt"
    let content = unlines
            [ "Your text: " ++ unwords wordList
            , "How many characters: " ++ show charCount
            , "How many words: " ++ show wordCount
            , "How many unique words: " ++ show uniqueWordsCount
            , "How many times is the letter a used: " ++ show uniqueCharCount
            , "Dubble char count result: " ++ show dubbleCharCountResult
            ]
    writeFile filename content
    putStrLn $ "File '" ++ filename ++ "' has been created."

-- Main
-- Dit is wat word gerunt als je het haskell programma start
main :: IO ()
main = do
    contents <- readFile "example.txt"
    putStrLn "Add a character to check how many times it occors in the text"
    charToAnalyze <- getChar
    analyzeText contents charToAnalyze