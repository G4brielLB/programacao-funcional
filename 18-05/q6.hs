funcConcat :: [[Int]] -> [Int]
funcConcat [] = []
funcConcat (x:xs) = x ++ funcConcat(xs)