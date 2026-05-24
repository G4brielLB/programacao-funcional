dobra :: [Int] -> [Int]
dobra [] = []
dobra (a:x) = do
    (2 * a) : dobra x

