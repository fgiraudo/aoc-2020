import Foundation

func treeCount(map: [String], right: Int, down: Int) -> Int {
    var treeCount = 0
    var column = 0
    var line = down
    
    for (index, var entry) in map.enumerated() {
        if line != index + 1 { continue }
        
        column += right
        line += down
        
        while column > entry.count - 1 {
            entry += entry
        }
        
        if entry[entry.index(entry.startIndex, offsetBy: column)] == "#" {
            treeCount += 1
        }
    }
    
    return treeCount
}
