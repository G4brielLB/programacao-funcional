def produto(l):
    if l == []:
        return 1
    p = l[0] * produto(l[1:])
    return p

if __name__ == "__main__":
    print(produto([10, 9, 2]))