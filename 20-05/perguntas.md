Exemplo. Agora vamos analisar um exemplo mais detalhado da aplicação de listas em Haskell, baseado em Simon Thompson [55]. Seja um banco de dados definido para contabilizar as retiradas de livros de uma Biblioteca, por várias pessoas. Para simular esta situação, vamos construir uma lista de tuplas compostas pelo nome da pessoa que tomou emprestado um livro e do título do livro. Para isto, teremos:

```haskell
type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]
```

Vamos construir uma lista (uma base de dados) fictícia para servir apenas de teste, ou seja, vamos supor que, em um determinado momento, esta lista esteja composta das seguintes tuplas:

```haskell
teste = [("Paulo", "A Mente Nova do Rei"), ("Ana", "O Segredo de Luiza"),
         ("Paulo", "O Pequeno Principe"), ("Mauro", "O Capital"),
         ("Francisco", "O Auto da Compadecida")]
```

Vamos definir funções para realizar as seguintes tarefas:

1. **Operações de consulta:**
   - Uma função que informa os livros que uma determinada pessoa tomou emprestado.
   - Uma função que informa todas as pessoas que tomaram emprestado um determinado livro.
   - Uma função que informa se um determinado livro está ou não emprestado.
   - Uma função que informa a quantidade de livros que uma determinada pessoa tomou emprestado.

2. **Operações de atualização:**
   - Uma função que atualiza a base de dados, quando um livro é emprestado a alguém.
   - Uma função que atualiza a base de dados quando um livro é devolvido.

Inicialmente, vamos construir a função `livrosEmprestados` que pode ser utilizada para servir de roteiro para a definição das outras funções de consulta, deixadas, como exercício, para o leitor.

```haskell
livrosEmprestados :: BancodeDados -> Pessoa -> [Livro]
livrosEmprestados [] _ = []
livrosEmprestados ((inquilino, titulo) : resto) fulano
  | inquilino == fulano = titulo : livrosEmprestados resto fulano
  | otherwise           = livrosEmprestados resto fulano
```

Vamos agora definir as funções de atualização:

```haskell
tomaEmprestado :: BancodeDados -> Pessoa -> Livro -> BancodeDados
tomaEmprestado dBase pessoa titulo = (pessoa, titulo) : dBase

devolveLivro :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolveLivro ((p, t): r) f l
  | p == f && t == l = r
  | otherwise        = (p, t) : devolveLivro r f l
devolveLivro [] ful tit = error "Não há livro emprestado"
```

Que motivos o leitor imagina que tenhamos levado em conta na definição da função `devolveLivro`, a exemplo da função `zip`, definida anteriormente, preferindo apresentar a definição para o padrão de lista vazia após a definição para o padrão de lista não vazia, quando o normal seria apresentar estes padrões na ordem inversa?

---

### Exercício

Modifique a base de dados da Biblioteca anterior e as funções de acesso, de forma que:
- Exista um número máximo de livros que uma pessoa possa tomar emprestado,
- Exista uma lista de palavras-chave associadas a cada livro, de forma que cada livro possa ser encontrado através das palavras-chave a ele associadas, e
- Existam datas associadas aos empréstimos, para poder detectar os livros com datas de empréstimos vencidas.
