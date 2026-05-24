-- zipSemPerdas [Int] -> [Int] -> 
zipSemPerdas :: [a1] -> [a2] -> [(a1, a2)]
zipSemPerdas a b = do
    if length a == length b then
        zip a b
    else if length a > length b then 
        zip a b ++ drop (length b) a
    else do
        zip a b ++ drop (length a) b

