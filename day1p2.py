with open("1.txt") as f:
    elfCaloryList = [sum(int(a) if a != "" else 0 for a in a.split("\n")) for a in f.read().split("\n\n")]
    total = 0 
    for i in range(3):
        total += max(elfCaloryList)
        elfCaloryList.remove(max(elfCaloryList))
    print(total)
    