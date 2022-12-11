explodeMap = [2,3,1]

with open("2.txt") as f:
    totalPoint = 0
    for line in f.read().splitlines():
        args = line.split(" ")
        A1Int = " ABC".index(args[0])
        A2Int = " XYZ".index(args[1])

        totalPoint += (A2Int - 1) * 3
        
        if A2Int == 1:
            totalPoint += explodeMap.index(A1Int) + 1
        elif A2Int == 2:
            totalPoint += A1Int
        elif A2Int == 3:
            totalPoint += explodeMap[(A1Int - 1)]

    print(totalPoint)
