1. Dada a defini¸c˜ao da fun¸c˜ao dobra
dobra :: [Int] -> [Int]
dobra [ ] = [ ]
dobra (a:x) = (2 * a) : dobra x

Calcule dobra [3,4,5] passo a passo.

2. Escreva [False, False, True] e [2] usando : e [ ].

3. Calcule somaLista [30, 2, 1, 0], dobra [0] e ”cafe”++ ”com”++ ”leite”.

4. Defina a função product :: [Int] -> Int que retorna o produto de uma lista de inteiros.

5. Defina a função and :: [Bool] -> Bool que retorna a conjunção da lista. Por exemplo,
and[e1, e2, . . . en] = e1&&e2&& . . . &&en.

6. Defina a função concat :: [[Int]] -> [Int] que concatena uma lista de listas de inteiros transformando-a em uma lista de inteiros. Por exemplo, concat[[3, 4], [2], [4, 10]] = [3, 4, 2, 4, 10].
