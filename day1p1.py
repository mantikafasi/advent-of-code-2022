with open("1.txt") as f:
    print(max([sum(int(a) if a != "" else 0 for a in a.split("\n")) for a in f.read().split("\n\n")]))