funcWhile = do
    putStrLn "Você quer continuar? (s/n)"
    r <- getLine
    if r == "s" || r == "S" then do
        putStrLn "Você continuou...insistente!"
        funcWhile
    else 
        putStrLn "Você desistiu...finalmente!"

main :: IO ()
main = do
    funcWhile