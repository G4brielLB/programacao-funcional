def funcAnd(l):
    if l == []:
        return True
    r = l[0] and funcAnd(l[1:])
    return r

if __name__ == "__main__":
    print(funcAnd([True, True, True, True]))