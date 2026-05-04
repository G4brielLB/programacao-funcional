funcSucc :: Int -> Int
funcSucc x = x + 1

funcPred :: Int -> Int
funcPred x = x - 1

add a b 
    | b == 0 = a
    | b > 0 = add(funcSucc a) (funcPred b)
    | b < 0 = add(funcPred a) (funcSucc b)

sub a b = add a (-b)

potencia a b
    | b == 0 = 1
    | b > 0 = a * (potencia a (b - 1))

calculadora = do
    putStrLn "Selecione uma operação:"
    putStrLn "0 - Sair"
    putStrLn "1 - Adição"
    putStrLn "2 - Subtração"
    putStrLn "3 - Potenciação"
    op <- readLn
    if op == 0 then
        putStrLn("Saindo...")
    else do
        if op == 1 then do
            putStrLn("SOMA")
            putStrLn("Digite o primeiro número:")
            num1 <- readLn
            putStrLn("Digite o segundo número:")
            num2 <- readLn
            putStrLn ("Resultado: " ++ show (add num1 num2))
        else if op == 2 then do
            putStrLn("SUBTRAÇÃO")
            putStrLn("Digite o primeiro número:")
            num1 <- readLn
            putStrLn("Digite o segundo número:")
            num2 <- readLn
            putStrLn ("Resultado: " ++ show (sub num1 num2))
        else if op == 3 then do
            putStrLn("POTENCIAÇÃO")
            putStrLn("Digite a base:")
            base <- readLn
            putStrLn("Digite o expoente:")
            expoente <- readLn
            putStrLn ("Resultado: " ++ show (potencia base expoente))
        else
            putStrLn("Operacao invalida")
        calculadora

main :: IO ()
main = do
    calculadora