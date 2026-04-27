sinal :: Int -> Int
sinal n
    | n > 0 = 1
    | n < 0 = -1
    | n == 0 = 0

fatorial :: Int -> Int
fatorial n 
    | n == 0 = 1
    | n > 0 = n * (fatorial (n - 1))

funcSinalFatorialQuadrado :: Int -> Int
funcSinalFatorialQuadrado n = sinal (fatorial (n * n))


main :: IO ()
main = do 
    putStrLn "Digite um número para calcular o sinal do fatorial de n ao quadrado:"
    n <- readLn
    putStrLn "O sinal do fatorial é:"
    print (funcSinalFatorialQuadrado n)