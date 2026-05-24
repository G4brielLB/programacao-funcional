type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]

teste = [("Paulo", "A Mente Nova do Rei"), ("Ana", "O Segredo de Luiza"),
    ("Paulo", "O Pequeno Principe"), ("Mauro", "O Capital"),
    ("Francisco", "O Auto da Compadecida"), ("Zevito", "O Capital"), ("Paulo", "Gordo")]

max_livros = 3

-- 01.
livrosEmprestados :: BancodeDados -> Pessoa -> [Livro]
livrosEmprestados [ ] _ = [ ]
livrosEmprestados ((inquilino, titulo) : resto) fulano
    |inquilino == fulano = titulo : livrosEmprestados resto fulano
    |otherwise = livrosEmprestados resto fulano

-- 02. 
pessoasLivros :: BancodeDados -> Livro -> [Pessoa]
pessoasLivros [ ] _ = [ ]
pessoasLivros ((inquilino, titulo) : resto) livro
    | titulo == livro = inquilino : pessoasLivros resto livro
    | otherwise = pessoasLivros resto livro

-- 03.
livroJaTaEmprestado :: BancodeDados -> Livro -> Bool
livroJaTaEmprestado [ ] _ = False
livroJaTaEmprestado ((inquilino, titulo) : resto) livro
    | titulo == livro = True
    | otherwise = livroJaTaEmprestado resto livro

-- 04. 
quantosLivrosPessoa :: BancodeDados -> Pessoa -> Int
quantosLivrosPessoa [ ] _ = 0
quantosLivrosPessoa ((inquilino, titulo) : resto) fulano
    | inquilino == fulano = (1 + quantosLivrosPessoa resto fulano)
    | otherwise = quantosLivrosPessoa resto fulano

-- 05.
tomaEmprestado :: BancodeDados -> Pessoa -> Livro -> IO BancodeDados
tomaEmprestado dBase pessoa titulo = do
    if quantosLivrosPessoa dBase pessoa >= max_livros then do
        putStrLn "A pessoa ja atingiu o limite de livros emprestados"
        return dBase
    else do
        putStrLn "Livro emprestado com sucesso!"
        return ((pessoa, titulo) : dBase)

-- 06.
devolveLivro :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolveLivro ((p, t): r) f l
    |p == f && t == l = r
    |otherwise = (p,t) : devolveLivro r f l
devolveLivro [ ] ful tit = error "Nao ha livro emprestado"


-- Exista um numero maximo de livros que uma pessoa possa tomar emprestado
