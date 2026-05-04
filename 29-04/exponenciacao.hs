exponenciacao a b
    | b == 0 = 1
    | b > 0 = a * (exponenciacao a (b - 1))

main :: IO () 
main = do
    putStrLn "Digite a base:"
    base <- readLn
    putStrLn "Digite o expoente:"
    expoente <- readLn
    putStrLn "A exponenciacao é:"
    if expoente < 0 then
        putStrLn (show 1 ++ "/" ++ show (exponenciacao base (-expoente)))
    else
        print (exponenciacao base expoente)

