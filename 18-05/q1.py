def dobra(l):
    if l == []:
        return []
    return ([l[0]*2] + dobra(l[1:]))

if __name__ == "__main__":
    print(dobra([3,4,5]))
    