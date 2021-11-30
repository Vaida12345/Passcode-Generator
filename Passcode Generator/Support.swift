//
//  Support.swift
//  Passcode Generator
//
//  Created by Vaida on 11/30/21.
//

import Foundation

let lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz".map{ String($0) }
let upperCaseLetters = lowerCaseLetters.map({ $0.uppercased() })
let numbers = "1234567890".map{ String($0) }
let specialSymbols = "~!@#$%^&*()_+|{}\":?><`-=[]\\;',./ ".map{ String($0) }

func generatePasscode(sectionsCount: Int, charactersPerSectionCount: Int, separator: String, includeUpperCase: Bool, includeLowerCase: Bool, includeNumbers: Bool, includeSpecialSymbols: Bool) -> String {
    
    var content: String = ""
    var allLetters: [String] = []
    
    if includeUpperCase { allLetters = Array(Set(allLetters).union(upperCaseLetters)) }
    if includeLowerCase { allLetters = Array(Set(allLetters).union(lowerCaseLetters)) }
    if includeNumbers { allLetters = Array(Set(allLetters).union(numbers)) }
    if includeSpecialSymbols { allLetters = Array(Set(allLetters).union(specialSymbols)) }
    
    var finishedSectionsCount = 0
    while finishedSectionsCount < sectionsCount {
        var subContent = ""
        while subContent.count < charactersPerSectionCount {
            subContent.append(allLetters.randomElement()!)
        }
        content.append(subContent)
        
        if finishedSectionsCount + 1 != sectionsCount {
            content.append(separator)
        }
        
        finishedSectionsCount += 1
    }
    
    if includeUpperCase {
        guard !content.allSatisfy({ !$0.isUppercase }) else {
            return generatePasscode(sectionsCount: sectionsCount, charactersPerSectionCount: charactersPerSectionCount, separator: separator, includeUpperCase: includeUpperCase, includeLowerCase: includeLowerCase, includeNumbers: includeNumbers, includeSpecialSymbols: includeSpecialSymbols)
        }
    }
    if includeLowerCase {
        guard !content.allSatisfy({ !$0.isLowercase }) else {
            return generatePasscode(sectionsCount: sectionsCount, charactersPerSectionCount: charactersPerSectionCount, separator: separator, includeUpperCase: includeUpperCase, includeLowerCase: includeLowerCase, includeNumbers: includeNumbers, includeSpecialSymbols: includeSpecialSymbols)
        }
    }
    if includeNumbers {
        guard !content.allSatisfy({ !$0.isNumber }) else {
            return generatePasscode(sectionsCount: sectionsCount, charactersPerSectionCount: charactersPerSectionCount, separator: separator, includeUpperCase: includeUpperCase, includeLowerCase: includeLowerCase, includeNumbers: includeNumbers, includeSpecialSymbols: includeSpecialSymbols)
        }
    }
    if includeSpecialSymbols {
        guard !content.allSatisfy({ !specialSymbols.contains(String($0)) }) else {
            return generatePasscode(sectionsCount: sectionsCount, charactersPerSectionCount: charactersPerSectionCount, separator: separator, includeUpperCase: includeUpperCase, includeLowerCase: includeLowerCase, includeNumbers: includeNumbers, includeSpecialSymbols: includeSpecialSymbols)
        }
    }
    
    return content
}
