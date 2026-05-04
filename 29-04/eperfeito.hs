funcMod a b
    | a == b = 0
    | a > b = funcMod (a - b) b
    | a < b = a

somaDiv n d s
    | d == 0 = s
    | funcMod n d == 0 = somaDiv n (d-1) (s+d)
    | otherwise = somaDiv n (d-1) s


eperfeito :: Int -> Bool
eperfeito n
    | somaDiv n (n-1) 0 == n = True
    | otherwise = False

main :: IO () 
main = do
    putStrLn "Digite um número:"
    num <- readLn
    putStrLn "O número é perfeito?"
    print (eperfeito num)