def potencia(a,b):
    if b == 0:
        return 1
    elif b > 0:
        return a * potencia(a, b-1)

if __name__ == "__main__":
    print("Digite primeiro a base e depois o expoente:")
    print("A potência é:",potencia(int(input()),int(input())))