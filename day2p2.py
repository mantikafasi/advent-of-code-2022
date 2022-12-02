# I know this is terrible way to do this, I just wrote it to finish it quick
with open("2.txt") as f:
    data = f.read().splitlines()
    totalPoint = 0
    for line in data:

        args = line.split(" ")
        A1 = args[0]
        A2 = args[1]
        A1Int = 1 if A1 == "A" else 2 if A1 == "B" else 3
        A2Int = 1 if A2 == "X" else 2 if A2 == "Y" else 3
    
        if A2 == "X":
            if A1 == "A":
                totalPoint += 3
            elif A1 == "B":
                totalPoint += 1
            elif A1 == "C":
                totalPoint += 2

        if A2 == "Y":
            if A1 == "A":
                totalPoint += 4
            elif A1 == "B":
                totalPoint += 5
            elif A1 == "C":
                totalPoint += 6

        if A2 == "Z":
            if A1 == "A":
                totalPoint += 8
            elif A1 == "B":
                totalPoint += 9
            elif A1 == "C":
                totalPoint += 7

    print(totalPoint)
