import UIKit

main()

func main() {
    if var answersInput = Utils().readInput(from: "input-day6") {
        let answers = parse(answersInput)
        
        var counter = 0
        
        for groupAnswer in answers {
            counter += groupAnswer.count
        }
        
        print(counter)
    }
}

func parse(_ input: [String]) -> [Set<Character>] {
    var result = [Set<Character>]()
    var groupAnswer = Set<Character>()
    var isFirstAnswer = true
    
    for answer in input {
        if answer.isEmpty {
            result.append(groupAnswer)
            groupAnswer.removeAll()
            isFirstAnswer = true
            continue
        }
        
        if isFirstAnswer {
            for char in answer {
                groupAnswer.insert(char)
            }
            isFirstAnswer = false
            
        } else {
            for char in groupAnswer {
                if answer.contains(char) == false {
                    groupAnswer.remove(char)
                }
            }
        }
    }
    
    return result
}
