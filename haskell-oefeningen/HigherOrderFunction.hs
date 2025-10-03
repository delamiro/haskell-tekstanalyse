dubbleCharCount :: (Int -> Int) -> Int -> Int
dubbleCharCount f x = f x

numberTimesTwo :: Int -> Int
numberTimesTwo x = x * 2


main :: IO ()
main = do
    print (dubbleCharCount numberTimesTwo 4) 