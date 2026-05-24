def funcConcat(l):
    if l == []:
        return []
    return l[0] + funcConcat(l[1:])
    

if __name__ == "__main__":
    print(funcConcat([[3,4], [2], [4,10]]))