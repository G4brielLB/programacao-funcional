def func_while():
    r = input("Você quer continuar? (s/n)")
    if r == "s" or r == "S":
        print("Você continuou...insistente!")
        func_while()
    else:
        print("Você desistiu...finalmente!")

if __name__ == "__main__":
    func_while()