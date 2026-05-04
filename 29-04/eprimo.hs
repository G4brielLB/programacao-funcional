funcMod a b
    | a == b = 0
    | a > b = funcMod (a - b) b
    | a < b = a

divisores n d q 
    | q > 2 || d == 0 = q
    | funcMod n d == 0 = divisores n (d - 1) (q + 1)
    | otherwise = divisores n (d - 1) q

eprimo :: Int -> Bool
eprimo n 
    | divisores n n 0 == 2 = True
    | otherwise = False

main :: IO () 
main = do
    putStrLn "Digite um número:"
    num <- readLn
    putStrLn "O número é primo?"
    print (eprimo num)