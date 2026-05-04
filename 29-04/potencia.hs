potencia a b
    | b == 0 = 1
    | b > 0 = a * (potencia a (b - 1))

main :: IO () 
main = do
    putStrLn "Digite a base:"
    base <- readLn
    putStrLn "Digite o expoente:"
    expoente <- readLn
    putStrLn "A potencia é:"
    print (potencia base expoente)