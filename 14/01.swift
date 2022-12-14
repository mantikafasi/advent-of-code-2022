import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
}

var array = [[String]](repeating: [String](repeating: ".", count: 70), count: 170)
var sandList = [[Int]]()

func printArray() {
    var horribleArray = array

    for sand in sandList {
        horribleArray[sand[0]][sand[1]] = "S"
    }

    for line in horribleArray {
        print(line.joined())
    }

    print("\n")
    
    print(fixedSand)
}

var fixedSand = 0

for line in try! String(contentsOfFile: "14.txt", encoding: .utf8).components(separatedBy: "\n") {
    var f = 0
    var s = 0
    line.components(separatedBy : "->").forEach { 
        let guh =  $0.trimmingCharacters(in:CharacterSet.whitespaces).components(separatedBy: ",")

        var first = Int(guh[0])! - 480
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

while (true) {
    sandList.append([0,20])

    for j in (0...1) {
        for i in 0...(sandList.count - 1) {
            var sand = sandList[i]
            
            if (canMove(x: sand[1], y: sand[0] + 1)) {
                sand[0] += 1
            } else if (canMove(x: sand[1] + 1, y: sand[0] + 1)) {
                sand[0] += 1
                sand[1] += 1

            } else if (canMove(x: sand[1] - 1, y: sand[0] + 1)) {
                sand[1] -= 1
                sand[0] += 1
            } else {
                fixedSand += 1
                array[sand[0]][sand[1]] = "F"
                sandList[i] = [0,0]
                continue
            }

            sandList[i] = sand
        }
        sandList = sandList.filter { $0 != [0,0] }
    }
    potato += 1

    if (potato == 1 ) {
        printArray()
        potato = 0
    }
    _sleep(100)
    
}
