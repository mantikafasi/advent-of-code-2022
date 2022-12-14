import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
}

let width = 400
var array = [[String]](repeating: [String](repeating: ".", count: width), count: 168 )
var sandList = [[Int]]()
var fixedSand = 0

for a in 0...width - 1 {
    array[167][a] = "#"
}

func printArray() {
    var horribleArray = array

    
    for sand in sandList {
        horribleArray[sand[0]][sand[1]] = "S"
    }

    for line in horribleArray {
        print(line.joined())
    }
    
    print(fixedSand)
}



for line in try! String(contentsOfFile: "14.txt", encoding: .utf8).components(separatedBy: "\n") {
    var f = 0
    var s = 0
    line.components(separatedBy : "->").forEach { 
        let guh =  $0.trimmingCharacters(in:CharacterSet.whitespaces).components(separatedBy: ",")

        var first = Int(guh[0])! - (730 - width)
        var second = Int(guh[1])!
        if (!( f == 0 && s == 0)) {
            var xrange = 0...0
            var yrange: ClosedRange<Int> = 0...0
            
            if (first > f) {
                xrange = 0...(first - f)
            } else {
                xrange = (first - f) ... 0
            }

            if (second > s) {
                yrange = 0...(second - s)
            } else {
                yrange = (second - s) ... 0
            }

            for a in yrange {
                array[s + a][first] = "#"
            }

            for a in xrange {
                array[second][f + a] = "#"
            }
        }

        f = first
        s = second
 
    }
} 

func canMove(x: Int, y: Int) -> Bool {
    if (array[y][x] == ".") {
        for sand in sandList {
            if (sand[0] == y && sand[1] == x) {
                return false
            }
        }

        return true
    }
    return false
}

var potato = 0

main: while (true) {
    sandList.append([0,width-230])

    while (sandList.count > 0) {        
        for i in 0...(sandList.count - 1) {
            var sand = sandList[i]
            
            if (canMove(x: sand[1], y: sand[0] + 1)) {
                sand[0] += 1
            } else if (canMove(x: sand[1] - 1, y: sand[0] + 1)) {
                sand[0] += 1
                sand[1] -= 1

            } else if (canMove(x: sand[1] + 1, y: sand[0] + 1)) {
                sand[1] += 1
                sand[0] += 1
            } else if (sand[0] == 0) {
                break main
            } else {
                array[sand[0]][sand[1]] = "F"
                sandList[i] = [0,0]
                fixedSand += 1

                continue
            }

            sandList[i] = sand
        }
        sandList.removeAll(where: { $0 == [0,0] })

    }
    potato += 1

    if (potato == 100) {
        printArray()
        potato = 0
    }
    
}

printArray() // at last we add 1 to the fixed sand count because the last sand is not counted

