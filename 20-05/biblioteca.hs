import Data.Time (Day, fromGregorian)

type Pessoa = String

type Livro = (String, [String])

type DataVencimento = Day

type Emprestimo = (Pessoa, Livro, DataVencimento)

type BancodeDados = [Emprestimo]

teste =
  [ ("Paulo", ("A Mente Nova do Rei", ["ciencia", "mente"]), fromGregorian 2026 5 20),
    ("Ana", ("O Segredo de Luiza", ["empreendedorismo"]), fromGregorian 2026 5 24),
    ("Paulo", ("O Pequeno Principe", ["infantil", "filosofia"]), fromGregorian 2026 5 17),
    ("Mauro", ("O Capital", ["economia", "marx"]), fromGregorian 2026 5 25),
    ("Francisco", ("O Auto da Compadecida", ["teatro", "nordeste"]), fromGregorian 2026 5 30)
  ]

-- Exista um numero maximo de livros que uma pessoa possa tomar emprestado
max_livros = 3

-- 01.
livrosEmprestados :: BancodeDados -> Pessoa -> [Livro]
livrosEmprestados [] _ = []
livrosEmprestados ((inquilino, livro, _) : resto) fulano
  | inquilino == fulano = livro : livrosEmprestados resto fulano
  | otherwise = livrosEmprestados resto fulano

-- 02.
pessoasLivros :: BancodeDados -> String -> [Pessoa]
pessoasLivros [] _ = []
pessoasLivros ((inquilino, livro, _) : resto) termo_buscado
  | matchLivro termo_buscado livro = inquilino : pessoasLivros resto termo_buscado
  | otherwise = pessoasLivros resto termo_buscado

-- 03.
livroJaTaEmprestado :: BancodeDados -> String -> Bool
livroJaTaEmprestado [] _ = False
livroJaTaEmprestado ((inquilino, livro, _) : resto) termo_buscado
  | matchLivro termo_buscado livro = True
  | otherwise = livroJaTaEmprestado resto termo_buscado

-- 04.
quantosLivrosPessoa :: BancodeDados -> Pessoa -> Int
quantosLivrosPessoa [] _ = 0
quantosLivrosPessoa ((inquilino, livro, _) : resto) fulano
  | inquilino == fulano = (1 + quantosLivrosPessoa resto fulano)
  | otherwise = quantosLivrosPessoa resto fulano

-- Exista um numero maximo de livros que uma pessoa possa tomar emprestado
-- 05.
tomaEmprestado :: BancodeDados -> Pessoa -> Livro -> DataVencimento -> IO BancodeDados
tomaEmprestado dBase pessoa (titulo, palavras_chave) data_vencimento = do
  if quantosLivrosPessoa dBase pessoa >= max_livros
    then do
      putStrLn "A pessoa ja atingiu o limite de livros emprestados"
      return dBase
    else do
      putStrLn "Livro emprestado com sucesso!"
      return ((pessoa, (titulo, palavras_chave), data_vencimento) : dBase)

-- 06.
devolveLivro :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolveLivro ((pessoa, livro, data_vencimento) : resto) fulano livro_devolvido
  | pessoa == fulano && livro == livro_devolvido = resto
  | otherwise = (pessoa, livro, data_vencimento) : devolveLivro resto fulano livro_devolvido
devolveLivro [] ful tit = error "Nao ha livro emprestado"

-- Palavras-chave
contemPalavraChave :: String -> [String] -> Bool
contemPalavraChave _ [] = False
contemPalavraChave termo_buscado (palavras_chave : resto_palavras)
  | termo_buscado == palavras_chave = True
  | otherwise = contemPalavraChave termo_buscado resto_palavras

matchLivro :: String -> Livro -> Bool
matchLivro termo_buscado (titulo, palavras_chave)
  | termo_buscado == titulo = True
  | otherwise = contemPalavraChave termo_buscado palavras_chave

-- Verificar livros atrasados
livrosAtrasados :: BancodeDados -> Day -> [Emprestimo]
livrosAtrasados [] _ = []
livrosAtrasados ((inquilino, livro, data_vencimento) : resto) data_atual
  | data_vencimento < data_atual = (inquilino, livro, data_vencimento) : livrosAtrasados resto data_atual
  | otherwise = livrosAtrasados resto data_atual