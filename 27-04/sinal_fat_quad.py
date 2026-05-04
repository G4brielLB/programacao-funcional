def fatorial(n):
    if n == 0:
        return 1
    elif n > 0:
        return n * (fatorial(n - 1))
    
def sinal(n):
    if n > 0:
        return 1
    elif n < 0:
        return -1
    elif n == 0:
        return 0

def funcSinalFatorialQuadrado(n):
    return sinal(fatorial(n * n))

if __name__ == "__main__":
    print("Digite um número para calcular o sinal do fatorial ao quadrado:")
    print(funcSinalFatorialQuadrado(int(input())))