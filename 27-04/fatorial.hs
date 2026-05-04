fatorial :: Int -> Int
fatorial n 
    | n == 0 = 1
    | n > 0 = n * (fatorial (n - 1))

main :: IO ()
main = do 
    putStrLn "Digite um número para calcular o fatorial:"
    num <- readLn
    putStrLn "O fatorial é:"
    print (fatorial num)