-- test.hs
-- A simple test file to print biggest and smallest Int values

-- Define constants
biggestInt, smallestInt :: Int
biggestInt  = maxBound
smallestInt = minBound

-- Main function to run the program
main :: IO ()
main = do
    putStrLn $ "Biggest Int: " ++ show biggestInt
    putStrLn $ "Smallest Int: " ++ show smallestInt
