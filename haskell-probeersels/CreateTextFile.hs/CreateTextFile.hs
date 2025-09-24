import System.IO

main :: IO ()
main = do
    let filename = "example.txt"
    let content = "Hello, Haskell can write to a file!"
    writeFile filename content
    putStrLn $ "File '" ++ filename ++ "' has been created."
