import Foundation

func main() {
    var passportsInput = [String]()
    
    print(passportsInput)
    
    passportsInput.removeLast()
    
    let passports = parsePassports(input: passportsInput)
    
    var counter = 0
    
    for passport in passports {
        if validate(passport) {
            counter += 1
        }
    }
    
    print("Number of valid passports: \(counter)")
}

func parsePassports(input: [String]) -> [[String: String]] {
    var passports: [[String: String]] = [[:]]
    
    var index = 0
    
    for passport in input {
        if passport.isEmpty {
            index += 1
            
            passports.append([:])
            
            continue
        }
        
        let entries = passport.split(separator: " ")
        
        for entry in entries {
            guard let key = entry.split(separator: ":").first, let value = entry.split(separator: ":").last else { continue }
            
            passports[index][String(key)] = String(value)
        }
    }
    
    return passports
}

func validate(_ passport: [String: String]) -> Bool {
    let requiredFields = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
    
    guard requiredFields.isSubset(of: passport.keys),
          let birthYearStr = passport["byr"], let birthYear = Int(birthYearStr), birthYear >= 1920 && birthYear <= 2002,
          let issueYearStr = passport["iyr"], let issueYear = Int(issueYearStr), issueYear >= 2010 && issueYear <= 2020,
          let expirationYearStr = passport["eyr"], let expirationYear = Int(expirationYearStr), expirationYear >= 2020 && expirationYear <= 2030 else {
        return false
    }
    
    guard validate(height: passport["hgt"]) else {
        return false
    }
    
    guard validate(hairColor: passport["hcl"]) else {
        return false
    }
    
    guard validate(eyeColor: passport["ecl"]) else {
        return false
    }
    
    guard validate(passportID: passport["pid"]) else {
        return false
    }
    
    return true
}

func validate(height: String?) -> Bool {
    guard let height = height else {
        return false
    }
    
    let unit = height.suffix(2)
    
    if unit == "cm" {
        guard let value = Int(height.prefix(3)), value >= 150 && value <= 193 else {
            return false
        }
        
        return true
    }
    
    if unit == "in" {
        guard let value = Int(height.prefix(2)), value >= 59 && value <= 76 else {
            return false
        }
        
        return true
    }
    
    return false
}

func validate(hairColor: String?) -> Bool {
    guard let hairColor = hairColor else {
        return false
    }
    
    return hairColor.range(of: "^[#][0-9a-f]{6}$", options: .regularExpression) != nil
}

func validate(eyeColor: String?) -> Bool {
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(eyeColor)
}

func validate(passportID: String?) -> Bool {
    guard let passportID = passportID else {
        return false
    }
    
    return passportID.range(of: "^[0-9]{9}$", options: .regularExpression) != nil
}
