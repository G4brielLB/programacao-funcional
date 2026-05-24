funcAnd :: [Bool] -> Bool
funcAnd [] = True
funcAnd (x:xs) = x && funcAnd xs