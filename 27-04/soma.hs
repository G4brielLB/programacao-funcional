soma :: Int -> Int -> Int
soma x y = x + y

main :: IO () 
main = do
    putStrLn "Digite o primeiro número:"
    num1 <- readLn

    putStrLn "Digite o segundo número:"
    num2 <- readLn

    putStrLn "A soma é:"
    print (soma num1 num2)