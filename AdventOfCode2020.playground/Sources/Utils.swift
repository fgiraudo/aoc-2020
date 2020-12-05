import Foundation

public class Utils {
    public init() {}
    
    public func readInput(from file: String) -> [String]? {
        if let path = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myInputs = data.components(separatedBy: .newlines)
                print(myInputs)
                
                return myInputs
            } catch {
                print(error)
                return nil
            }
        }
        
        return nil
    }
}
