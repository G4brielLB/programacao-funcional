def exponenciacao(a,b):
    if b == 0:
        return 1
    elif b > 0:
        return a * exponenciacao(a, b-1)

if __name__ == "__main__":
    print("Digite a base:")
    a = int(input())
    print("Digite o expoente:")
    b = int(input())
    print("A exponenciacao é:")
    if b < 0:
        print("1 /", exponenciacao(a, -b))
    else:
        print(exponenciacao(a, b))