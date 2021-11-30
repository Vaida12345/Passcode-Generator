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
     
    
    var finishedSectionsCount = 0
    while finishedSectionsCount < sectionsCount {
        var subContent = ""
        while subContent.count < charactersPerSectionCount {
            
        }
    }
    
    return ""
}
