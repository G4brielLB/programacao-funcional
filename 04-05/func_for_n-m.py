def funcFor(n, m):
    if n >= m:
        print(n)
    else:
        print(n)
        funcFor(n+1, m)

if __name__ == "__main__":
    print("Digite dois números (o segundo maior que o primeiro)")
    funcFor(int(input("Primeiro: ")), int(input("Segundo: ")))
    