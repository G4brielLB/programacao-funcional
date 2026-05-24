# Guia de Testes Interativos no GHCI

Este arquivo contém todos os comandos prontos para você copiar, colar e rodar no seu terminal com o `ghci` ativo para validar cada uma das funções de `biblioteca.hs`.

---

### Passo 0: Preparar e Carregar o Arquivo

Antes de colar os testes, recarregue o seu arquivo no `ghci`:
```haskell
:l biblioteca.hs
```

---

### 1. Testar `livrosEmprestados`
Retorna a lista de livros (`Livro`) que uma determinada pessoa pegou.

*   **Comando:**
    ```haskell
    livrosEmprestados teste "Paulo"
    ```
*   **Resultado Esperado:** 
    ```haskell
    [("A Mente Nova do Rei",["ciencia","mente"]),("O Pequeno Principe",["infantil","filosofia"])]
    ```

---

### 2. Testar `pessoasLivros`
Busca todas as pessoas que pegaram um livro associado a um título ou palavra-chave.

*   **Buscar por Título Exato:**
    ```haskell
    pessoasLivros teste "O Capital"
    ```
    *   **Resultado Esperado:** `["Mauro"]`

*   **Buscar por Palavra-chave:**
    ```haskell
    pessoasLivros teste "filosofia"
    ```
    *   **Resultado Esperado:** `["Paulo"]` (pois ele pegou "O Pequeno Principe", que tem a tag "filosofia")

*   **Buscar por Termo Inexistente:**
    ```haskell
    pessoasLivros teste "invenção"
    ```
    *   **Resultado Esperado:** `[]`

---

### 3. Testar `livroJaTaEmprestado`
Verifica se um livro está emprestado usando o título ou uma palavra-chave.

*   **Verificar por Título:**
    ```haskell
    livroJaTaEmprestado teste "O Capital"
    ```
    *   **Resultado Esperado:** `True`

*   **Verificar por Palavra-Chave:**
    ```haskell
    livroJaTaEmprestado teste "empreendedorismo"
    ```
    *   **Resultado Esperado:** `True`

*   **Verificar Livro Não Emprestado:**
    ```haskell
    livroJaTaEmprestado teste "Haskell Básico"
    ```
    *   **Resultado Esperado:** `False`

---

### 4. Testar `quantosLivrosPessoa`
Retorna a quantidade de livros emprestados de uma pessoa.

*   **Comando:**
    ```haskell
    quantosLivrosPessoa teste "Paulo"
    ```
    *   **Resultado Esperado:** `2`

*   **Comando:**
    ```haskell
    quantosLivrosPessoa teste "Ana"
    ```
    *   **Resultado Esperado:** `1`

---

### 5. Testar `tomaEmprestado` (Efeito IO)
Valida a inserção e o limite máximo de livros por pessoa (`max_livros = 3`).

*   **Cenário 1: Empréstimo bem-sucedido**
    ```haskell
    teste_novo <- tomaEmprestado teste "Ana" ("Haskell para Iniciantes", ["programacao"]) (fromGregorian 2026 10 30)
    ```
    *   **Mensagem na Tela:** `Livro emprestado com sucesso!`
    *   *Agora digite `teste_novo` no terminal para ver a nova base de dados com o livro da Ana adicionado.*

*   **Cenário 2: Atingir o limite máximo**
    Paulo já tem 2 livros na base original. Vamos emprestar o 3º livro para ele:
    ```haskell
    teste_paulo3 <- tomaEmprestado teste "Paulo" ("Livro Três", ["teste"]) (fromGregorian 2026 10 30)
    ```
    *   **Mensagem na Tela:** `Livro emprestado com sucesso!`
    
    Agora, vamos tentar fazer o Paulo pegar o 4º livro (o que deve ser bloqueado pelo limite de 3):
    ```haskell
    tomaEmprestado teste_paulo3 "Paulo" ("Livro Quatro", ["bloqueado"]) (fromGregorian 2026 10 30)
    ```
    *   **Mensagem na Tela:** `A pessoa ja atingiu o limite de livros emprestados`
    *   **Retorno:** A base de dados retorna intacta, sem adicionar o Livro Quatro!

---

### 6. Testar `devolveLivro`
Remove um livro do registro de empréstimos.

*   **Devolver com Sucesso:**
    ```haskell
    devolveLivro teste "Ana" ("O Segredo de Luiza", ["empreendedorismo"])
    ```
    *   **Resultado Esperado:** Retorna a base de dados contendo todos os empréstimos originais, menos o empréstimo da Ana.

*   **Tentar Devolver Livro Inexistente (Lança Exceção):**
    ```haskell
    devolveLivro teste "Ana" ("Livro Fantasma", [])
    ```
    *   **Resultado Esperado:** `*** Exception: Nao ha livro emprestado`

### 7. Testar `livrosAtrasados`
Verifica quais empréstimos estão com a data de vencimento anterior à data informada (retorna uma lista de `Emprestimo`).

Com a nova base de dados onde as datas variam entre **17/05/2026 e 30/05/2026**:

*   **Cenário 1: Data atual em 22/05/2026 (Apenas alguns vencidos)**
    Se a data de hoje for dia 22/05/2026, os empréstimos que venceram nos dias 17 e 20 constam como atrasados:
    ```haskell
    livrosAtrasados teste (fromGregorian 2026 5 22)
    ```
    *   **Resultado Esperado:** 
        ```haskell
        [("Paulo",("A Mente Nova do Rei",["ciencia","mente"]),2026-05-20),("Paulo",("O Pequeno Principe",["infantil","filosofia"]),2026-05-17)]
        ```

*   **Cenário 2: Data atual em 15/05/2026 (Nenhum vencido ainda)**
    Se hoje for dia 15/05/2026, nenhum empréstimo estará vencido:
    ```haskell
    livrosAtrasados teste (fromGregorian 2026 5 15)
    ```
    *   **Resultado Esperado:** `[]` (lista vazia)

*   **Cenário 3: Data atual em 01/06/2026 (Todos vencidos)**
    Se hoje for dia 01/06/2026, todos os empréstimos já terão passado da data de vencimento:
    ```haskell
    livrosAtrasados teste (fromGregorian 2026 6 1)
    ```
    *   **Resultado Esperado:** A lista com todos os 5 empréstimos da base de dados `teste`.
