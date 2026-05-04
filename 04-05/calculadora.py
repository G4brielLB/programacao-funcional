def funcSucc(x):
    return x + 1

def funcPred(x):
    return x - 1

def soma(a, b):
    if (b == 0):
        return a
    elif b > 0: 
        return soma(funcSucc(a), funcPred(b))
    elif b < 0:
        return soma(funcPred(a), funcSucc(b))

def sub(a, b):
    return soma(a, -b)

def potencia(a, b):
    if b == 0:
        return 1
    elif b > 0: 
        return a * potencia(a, b-1)

def calculadora():
    print("""
    Escolha uma operacao
    0 - Sair
    1 - Adicao
    2 - Subtracao
    3 - Potenciacao
 """)
    op = int(input())
    if op == 0:
        print("Saindo...")
    else:
        if op == 1:
            print("SOMA")
            x = int(input("Digite o primeiro numero: "))
            y = int(input("Digite o segundo numero: "))
            print("Resultado: ", soma(x, y))
        elif op == 2:
            print("SUBTRACAO")
            x = int(input("Digite o primeiro numero: "))
            y = int(input("Digite o segundo numero: "))
            print("Resultado: ", sub(x, y))
        elif op == 3:
            print("POTENCIACAO")
            x = int(input("Digite o primeiro numero: "))
            y = int(input("Digite o segundo numero: "))
            print("Resultado: ", potencia(x, y))
        else:
            print("Operação Invalida")
        calculadora()

if __name__ == "__main__":
    calculadora()