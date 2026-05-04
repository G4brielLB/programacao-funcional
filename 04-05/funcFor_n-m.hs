funcFor n m
    | n >= m = print(n)
    | otherwise = do 
        print(n)
        funcFor (n+1) m


main :: IO ()
main = do 
    putStrLn "Digite um número:"
    n <- readLn
    putStrLn "Digite um número maior:"
    m <- readLn
    putStrLn "Contagem:"
    funcFor n m