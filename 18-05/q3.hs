somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

somaListaDiff :: [Int] -> Int
somaListaDiff soma = head soma + somaListaDiff (tail soma)

dobra :: [Int] -> [Int]
dobra [] = []
dobra (a:x) = do
    (2 * a) : dobra x

cafe_com_leite = show "cafe " ++ "com " ++ "leite"


