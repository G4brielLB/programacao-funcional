def soma_lista(l):
    if len(l) == 0:
        return 0
    r = l[0] + soma_lista(l[1:])
    return r

def dobra(l):
    if l == []:
        return []
    return ([l[0]*2] + dobra(l[1:]))

def cafe_com_leite():
    print("cafe " + "com " + "leite")

if __name__ == "__main__":
    print(soma_lista([30, 2, 1, 0]))
    print(dobra([3,4,5]))
    cafe_com_leite()