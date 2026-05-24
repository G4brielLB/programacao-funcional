produto :: [Int] -> Int
produto [] = 1 
produto (x:xs) = x * produto xs