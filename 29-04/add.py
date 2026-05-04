def func_succ(x):
    return x + 1

def func_pred(x):
    return x - 1

def add(a,b):
    if b == 0:
        return a
    elif b > 0:
        return add(func_succ(a), func_pred(b))

if __name__ == "__main__":
    print("Digite dois números:")
    print("A soma é:", add(int(input()),int(input())))