# Guia de Testes Interativos no Python REPL

Este arquivo contém todos os comandos prontos para você copiar, colar e rodar no seu terminal com o interpretador interativo do `python3` ativo para validar cada uma das funções de `biblioteca.py`.

---

### Passo 0: Preparar e Carregar o Interpretador

Abra o terminal do sistema na mesma pasta e inicie o interpretador:
```bash
python3
```

Antes de colar os testes, importe a biblioteca e inicialize a base de dados de teste:
```python
from biblioteca import *
from datetime import datetime

banco = base_teste()
```

---

### 1. Testar `livros_emprestados`
Retorna a lista de livros (`Livro`) que uma determinada pessoa pegou.

*   **Comando:**
    ```python
    livros_emprestados(banco, "Paulo")
    ```
*   **Resultado Esperado:** 
    ```python
    [('A Mente Nova do Rei', ['ciencia', 'mente']), ('O Pequeno Principe', ['infantil', 'filosofia'])]
    ```

---

### 2. Testar `pessoas_livros`
Busca todas as pessoas que pegaram um livro associado a um título ou palavra-chave.

*   **Buscar por Título Exato:**
    ```python
    pessoas_livros(banco, "O Capital")
    ```
    *   **Resultado Esperado:** `['Mauro']`

*   **Buscar por Palavra-chave:**
    ```python
    pessoas_livros(banco, "filosofia")
    ```
    *   **Resultado Esperado:** `['Paulo']` (pois ele pegou "O Pequeno Principe", que tem a tag "filosofia")

*   **Buscar por Termo Inexistente:**
    ```python
    pessoas_livros(banco, "invenção")
    ```
    *   **Resultado Esperado:** `[]`

---

### 3. Testar `livro_ja_ta_emprestado`
Verifica se um livro está emprestado usando o título ou uma palavra-chave.

*   **Verificar por Título:**
    ```python
    livro_ja_ta_emprestado(banco, "O Capital")
    ```
    *   **Resultado Esperado:** `True`

*   **Verificar por Palavra-Chave:**
    ```python
    livro_ja_ta_emprestado(banco, "empreendedorismo")
    ```
    *   **Resultado Esperado:** `True`

*   **Verificar Livro Não Emprestado:**
    ```python
    livro_ja_ta_emprestado(banco, "Haskell Básico")
    ```
    *   **Resultado Esperado:** `False`

---

### 4. Testar `quantos_livros_pessoa`
Retorna a quantidade de livros emprestados de uma pessoa.

*   **Comando:**
    ```python
    quantos_livros_pessoa(banco, "Paulo")
    ```
    *   **Resultado Esperado:** `2`

*   **Comando:**
    ```python
    quantos_livros_pessoa(banco, "Ana")
    ```
    *   **Resultado Esperado:** `1`

---

### 5. Testar `toma_emprestado`
Valida a inserção e o limite máximo de livros por pessoa (`max_livros() == 3`).

*   **Cenário 1: Empréstimo bem-sucedido**
    ```python
    banco_novo = toma_emprestado(banco, "Ana", ("Haskell para Iniciantes", ["programacao"]), datetime(2026, 10, 30))
    ```
    *   **Saída na Tela:** `Livro emprestado com sucesso!`
    *   *Agora digite `banco_novo` para ver a base de dados atualizada.*

*   **Cenário 2: Atingir o limite máximo**
    Paulo já tem 2 livros na base original. Vamos emprestar o 3º livro para ele:
    ```python
    banco_paulo3 = toma_emprestado(banco, "Paulo", ("Livro Três", ["teste"]), datetime(2026, 10, 30))
    ```
    *   **Saída na Tela:** `Livro emprestado com sucesso!`
    
    Agora, vamos tentar fazer o Paulo pegar o 4º livro (o que deve ser bloqueado pelo limite de 3):
    ```python
    toma_emprestado(banco_paulo3, "Paulo", ("Livro Quatro", ["bloqueado"]), datetime(2026, 10, 30))
    ```
    *   **Saída na Tela:** `A pessoa ja atingiu o limite de livros emprestados`
    *   **Retorno:** A base de dados retorna intacta (`banco_paulo3`), sem adicionar o Livro Quatro.

---

### 6. Testar `devolve_livro`
Remove um livro do registro de empréstimos.

*   **Devolver com Sucesso:**
    ```python
    devolve_livro(banco, "Ana", ("O Segredo de Luiza", ["empreendedorismo"]))
    ```
    *   **Resultado Esperado:** Retorna a base de dados original sem a Ana.

*   **Tentar Devolver Livro Inexistente (Lança Exceção):**
    ```python
    devolve_livro(banco, "Ana", ("Livro Fantasma", []))
    ```
    *   **Resultado Esperado:** `Exception: Nao ha livro emprestado`

---

### 7. Testar `livros_atrasados`
Verifica quais empréstimos estão com a data de vencimento anterior à data informada (retorna a tupla completa do registro de empréstimo).

Com a base de dados de teste onde as datas variam entre **17/05/2026 e 30/05/2026**:

*   **Cenário 1: Data atual em 22/05/2026 (Apenas alguns vencidos)**
    ```python
    livros_atrasados(banco, datetime(2026, 5, 22))
    ```
    *   **Resultado Esperado:** 
        ```python
        [
            ("Paulo", ("A Mente Nova do Rei", ["ciencia", "mente"]), datetime(2026, 5, 20)),
            ("Paulo", ("O Pequeno Principe", ["infantil", "filosofia"]), datetime(2026, 5, 17))
        ]
        ```

*   **Cenário 2: Data atual em 15/05/2026 (Nenhum vencido ainda)**
    ```python
    livros_atrasados(banco, datetime(2026, 5, 15))
    ```
    *   **Resultado Esperado:** `[]` (lista vazia)

*   **Cenário 3: Data atual em 31/05/2026 (Todos vencidos)**
    ```python
    livros_atrasados(banco, datetime(2026, 5, 31))
    ```
    *   **Resultado Esperado:** A lista com todos os 5 empréstimos completos da base de dados `banco`.

