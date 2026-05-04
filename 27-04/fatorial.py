def fatorial(n):
    if n == 0:
        return 1
    elif n > 0:
        return n * (fatorial(n - 1))

if __name__ == "__main__":
    print("Digite um número para calcular o fatorial:")
    print(fatorial(int(input())))