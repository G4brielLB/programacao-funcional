from datetime import datetime

def base_teste():
    return [
        ("Paulo", ("A Mente Nova do Rei", ["ciencia", "mente"]), datetime(2026, 5, 20)),
        ("Ana", ("O Segredo de Luiza", ["empreendedorismo"]), datetime(2026, 5, 24)),
        ("Paulo", ("O Pequeno Principe", ["infantil", "filosofia"]), datetime(2026, 5, 17)),
        ("Mauro", ("O Capital", ["economia", "marx"]), datetime(2026, 5, 25)),
        ("Francisco", ("O Auto da Compadecida", ["teatro", "nordeste"]), datetime(2026, 5, 30))
    ]

def max_livros():
    return 3


# --- Auxiliares de Palavras-Chave ---

def contem_palavra_chave(termo_buscado, palavras_chave):
    if not palavras_chave:
        return False
    palavra = palavras_chave[0]
    resto = palavras_chave[1:]
    if termo_buscado == palavra:
        return True
    return contem_palavra_chave(termo_buscado, resto)


def match_livro(termo_buscado, livro):
    titulo, palavras_chave = livro
    if termo_buscado == titulo:
        return True
    return contem_palavra_chave(termo_buscado, palavras_chave)


# --- 01. Livros Emprestados ---
def livros_emprestados(banco, fulano):
    if not banco:
        return []
    inquilino, livro, _ = banco[0]
    resto = banco[1:]
    if inquilino == fulano:
        return [livro] + livros_emprestados(resto, fulano)
    return livros_emprestados(resto, fulano)


# --- 02. Pessoas que pegaram um livro (por título ou tag) ---
def pessoas_livros(banco, termo_buscado):
    if not banco:
        return []
    inquilino, livro, _ = banco[0]
    resto = banco[1:]
    if match_livro(termo_buscado, livro):
        return [inquilino] + pessoas_livros(resto, termo_buscado)
    return pessoas_livros(resto, termo_buscado)


# --- 03. Livro está emprestado ---
def livro_ja_ta_emprestado(banco, termo_buscado):
    if not banco:
        return False
    _, livro, _ = banco[0]
    resto = banco[1:]
    if match_livro(termo_buscado, livro):
        return True
    return livro_ja_ta_emprestado(resto, termo_buscado)


# --- 04. Quantidade de livros de uma pessoa ---
def quantos_livros_pessoa(banco, fulano):
    if not banco:
        return 0
    inquilino, _, _ = banco[0]
    resto = banco[1:]
    if inquilino == fulano:
        return 1 + quantos_livros_pessoa(resto, fulano)
    return quantos_livros_pessoa(resto, fulano)


# --- 05. Toma Emprestado ---
def toma_emprestado(banco, pessoa, livro, data_vencimento):
    if quantos_livros_pessoa(banco, pessoa) >= max_livros():
        print("A pessoa ja atingiu o limite de livros emprestados")
        return banco
    else:
        print("Livro emprestado com sucesso!")
        return [(pessoa, livro, data_vencimento)] + banco


# --- 06. Devolve Livro ---
def devolve_livro(banco, fulano, livro_devolvido):
    if not banco:
        raise Exception("Nao ha livro emprestado")
    pessoa, livro, data_vencimento = banco[0]
    resto = banco[1:]
    if pessoa == fulano and livro == livro_devolvido:
        return resto
    return [(pessoa, livro, data_vencimento)] + devolve_livro(resto, fulano, livro_devolvido)


# --- 07. Livros Atrasados ---
def livros_atrasados(banco, data_atual):
    if not banco:
        return []
    emprestimo = banco[0]
    resto = banco[1:]
    if esta_atrasado(emprestimo, data_atual):
        return [emprestimo] + livros_atrasados(resto, data_atual)
    return livros_atrasados(resto, data_atual)

def esta_atrasado(emprestimo, data_atual):
    _, _, data_vencimento = emprestimo
    return data_vencimento < data_atual