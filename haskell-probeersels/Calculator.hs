

calc :: String -> Double -> Double -> Double
calc op a b
    | op == "+" = a + b
    | op == "-" = a - b
    | op == "*" = a * b

main :: IO ()
main = do
    putStrLn "What type of calculation do you want to do?"
    calcStr <- getLine
    putStrLn "What is the first number?"
    firstNumber <- readLn :: IO Double
    putStrLn "What is the second number?"
    secondNumber <- readLn :: IO Double

    let result = calc calcStr firstNumber secondNumber


    

    -- "show" in this print makes the result a Str instead of a Int
    putStrLn ("Your number is: " ++ show result)
