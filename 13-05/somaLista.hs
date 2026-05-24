somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

somaListaDiff :: [Int] -> Int
somaListaDiff soma = head soma + somaListaDiff (tail soma)
        