monkeys = []

import ast

with open("11.txt","r") as f:
    monke = {}
    for line in f:
        

        if "Starting items" in line:
            monke["starting"] = (line.split("Starting items:")[1].strip().split(","))
        elif "Operation" in line:
            monke["operation"] = (line.split("Operation: new = ")[1])
        elif "Test" in line:
            monke["test"] = (int(line.split("Test: divisible by")[1]))
        elif "If true: throw to monkey" in line:
            monke["true"] = int(line.split("If true: throw to monkey")[1])
        elif "If false: throw to monkey" in line:
            monke["false"] = int(line.split("If false: throw to monkey")[1])
        elif "Monkey" in line and monke != {}:
            monke["inspectCount"] = 0

            monkeys.append(monke)
            monke = {}

    monke["inspectCount"] = 0
    monkeys.append(monke)

    for round in range(20):
        for monkey in monkeys:
            operation = monkey["operation"]
            for item in monkey["starting"]:
                monkey["inspectCount"] += 1

                guh = (operation.replace("old",item).strip())
                
                newItem = int(eval(guh) / 3)


                if newItem % monkey["test"] == 0:
                    monkeys[int(monkey["true"])]["starting"].append(str(newItem))
                else:
                    monkeys[int(monkey["false"])]["starting"].append(str(newItem))

            monkey["starting"].clear()         
    inspectCounts = []

    for monkey in monkeys:
        inspectCounts.append(monkey["inspectCount"])

    inspectCounts.sort()
    print(inspectCounts[-1] * inspectCounts[-2])
    print(inspectCounts)
    #print(monkeys)[]
            