
def doArray(a,b):
    correct = 2
    if (type(a) == int):
        a = [a,]
    if (type(b) == int) :
        b = [b,]

    if (a == b):
        return 1

    for k in range(len(a)):
        try:
            if type(a[k]) == list or type(b[k]) == list:
                correct = doArray(a[k],b[k])
                if correct == 2 or correct == 0:
                    return correct
            if b[k] < a[k]:
                return 0
            elif b[k] > a[k]:
                return 2
        except:
            pass
    
    if (len(a) > len(b)):
        return 0
    else:
        return 2

count = 0

with open("13.txt","r") as f:
    i = 0
    for guh in f.read().split("\n\n"):
        i+=1

        first,second = [eval(a) for a in guh.strip().split("\n")]
        
        correct = 1

        for j in range(len(first)):
            try:
                a, b = first[j], second[j]
                
                if type(a) == type(b) == int:
                    if b < a:
                        correct = 0
                else:
                    correct = doArray(a,b)
            except:
                pass
                
            if correct == 1 and len(second) > len(first):
                correct = 2

            if correct == 0 or correct == 2:
                break

        if correct == 2:
            count+=i
print(count)

