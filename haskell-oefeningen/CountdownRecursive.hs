countdown :: Int -> IO ()
countdown n =
    if n <= 0 then
        putStrLn "Done!"          
        -- base case
    else do
        print n                   
        countdown (n - 1)         -- recursive call

main :: IO ()
main = do
    putStrLn "Number"
    numberStr <- getLine
    let number = read numberStr :: Int
    countdown number