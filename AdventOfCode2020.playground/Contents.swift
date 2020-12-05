import UIKit

main()

func main() {
    if var boardingPasses = Utils().readInput(from: "input-day5") {
        boardingPasses.removeLast()
        
        print(boardingPasses)
        
        var maxSeatID = 0
        
//        print("Row: \(column(for: "RRR"))")
        
        for boardingPass in boardingPasses {
            let seat = findSeat(for: boardingPass)
            
            print(seat)
            
            let seatID = calculateSeatID(for: seat)

            if seatID > maxSeatID {
                maxSeatID = seatID
            }
        }
        
        print(findMissingSeatID(in: boardingPasses))
        
        print(maxSeatID)
    }
}

func findSeat(for boardingPass: String) -> (Int, Int) {
    let rowInput = String(boardingPass.prefix(7))
    let columnInput = String(boardingPass.suffix(3))
    
    return (row(for: rowInput), column(for: columnInput))
}

func row(for rowInput: String) -> Int {
    var range = 0 ..< 127
    
    for (index, char) in rowInput.enumerated() {
        if char == "F" {
            if index == rowInput.count - 1 {
                return range.first ?? 0
            }
            
            range = range.prefix((range.max()! - range.min()! + 1) / 2)
        } else {
            if index == rowInput.count - 1 {
                return (range.first ?? 0) + 1
            }
            
            range = range.suffix((range.max()! - range.min()! + 1) / 2)
        }
    }
    
    return 0
}

func column(for columnInput: String) -> Int {
    var range = 0 ..< 7
    
    for (index, char) in columnInput.enumerated() {
        if char == "L" {
            if index == columnInput.count - 1 {
                return range.first ?? 0
            }
            
            range = range.prefix((range.max()! - range.min()! + 1) / 2)
        } else {
            if index == columnInput.count - 1 {
                return (range.first ?? 0) + 1
            }
            
            range = range.suffix((range.max()! - range.min()! + 1) / 2)
        }
    }
    
    return 0
}

func calculateSeatID(for seat: (Int, Int)) -> Int {
    seat.0 * 8 + seat.1
}

func findMissingSeatID(in boardingPasses: [String]) -> Int {
    var seatMap = Array(repeating: 0, count: 979)
    
    for boardingPass in boardingPasses {
        let seat = findSeat(for: boardingPass)
        let seatID = calculateSeatID(for: seat)

        seatMap[seatID] = 1
    }
    
    for index in seatMap.firstIndex(of: 1)! ..< seatMap.count {
        if seatMap[index] == 0 {
            return index
        }
    }
    
    return 0
}
