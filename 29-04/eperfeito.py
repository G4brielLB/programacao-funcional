def func_mod(a, b):
    if a == b:
        return 0
    elif a > b:
        return func_mod(a - b, b)
    elif a < b:
        return a

def soma_div(n, d, s):
    if d == 0:
        return s
    elif func_mod(n, d) == 0:
        return soma_div(n, d-1, s + d)
    else:
        return soma_div(n, d-1, s)

def eperfeito(n):
    if soma_div(n, n-1, 0) == n:
        return True
    else:
        return False



if __name__ == "__main__":
    print("Digite um número:")
    print("O número é perfeito?", eperfeito(int(input())))