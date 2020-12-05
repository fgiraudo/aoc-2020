import Foundation

func checkOldPolicy(_ passwordArr: [String.SubSequence]) -> Bool {
    let policy = passwordArr[0].split(separator: "-")
    
    guard let policyMin = Int(policy[0]), let policyMax = Int(policy[1]) else {
        return false
    }
    
    let char = passwordArr[1].first
    let password = passwordArr[2]
    let count = (password.filter { $0 == char }).count
    
    return (policyMin ... policyMax).contains(count)
}

func checkNewPolicy(_ passwordArr: [String.SubSequence]) -> Bool {
    let policy = passwordArr[0].split(separator: "-")
    
    guard let firstPosition = Int(policy[0]), let secondPosition = Int(policy[1]) else {
        return false
    }
    
    let seed = passwordArr[1].first
    let password = passwordArr[2]
    var occurences = 0
    
    for (index, char) in password.enumerated() {
        if [firstPosition, secondPosition].contains(index + 1) && char == seed {
            occurences += 1
        }
    }
    
    return occurences == 1
}
