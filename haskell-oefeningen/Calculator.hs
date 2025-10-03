calc :: String -> Float -> Float -> Float
calc op a b
    | op == "+" = a + b
    | op == "-" = a - b
    | op == "*" = a * b
    | op == "/" = a / b


main :: IO ()
main = do
    putStrLn "What type of calculation do you want to do?"
    calcStr <- getLine
    putStrLn "What is the first number?"
    firstNumber <- readLn :: IO Float
    putStrLn "What is the second number?"
    secondNumber <- readLn :: IO Float

    let result = calc calcStr firstNumber secondNumber

    -- "show" in this print makes the result a Str instead of a Int
    putStrLn ("Your number is: " ++ show result)
