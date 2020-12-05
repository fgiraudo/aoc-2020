import Foundation

func process(_ inputs: [String]) {
    var intInputs: [Int] = []

    for input in inputs {
        if let int = Int(input) {
            intInputs.append(int)
        }
    }
    
    for i in 0 ..< intInputs.count {
        for j in i + 1 ..< intInputs.count {
            for z in j + 1 ..< intInputs.count {
                if intInputs[i] + intInputs[j] + intInputs[z] == 2020 {
                    print("first number: \(intInputs[i])")
                    print("second number: \(intInputs[j])")
                    print("third number: \(intInputs[z])")
                    print("result: \(intInputs[i] * intInputs[j] * intInputs[z])")
                }
            }
        }
    }
}
