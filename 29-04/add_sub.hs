funcSucc :: Int -> Int
funcSucc x = x + 1

funcPred :: Int -> Int
funcPred x = x - 1

add :: Int -> Int -> Int
add a b 
    | b == 0 = a
    | b > 0 = add(funcSucc a) (funcPred b)
    | b < 0 = add(funcPred a) (funcSucc b)

sub a b = add x (-y)

main :: IO () 
main = do
    putStrLn "Digite dois números:"
    num1 <- readLn
    num2 <- readLn
    putStrLn "A soma é:"
    print (add num1 num2)