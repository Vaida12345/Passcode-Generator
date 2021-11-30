//
//  ContentView.swift
//  Passcode Generator
//
//  Created by Vaida on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfSections: Double = 3
    @State var numberOfCharactersPerSection: Double = 6
    @State var separator: String = "-"
    
    @State var includeUpperCasedLetters: Bool = true
    @State var includeLowerCasedLetters: Bool = true
    @State var includeNumbers: Bool = true
    @State var includeSpecialSymbols: Bool = true
    
    @State var passcode: String = "1234567890"
    @State var isCopied = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ConfigView(value: $numberOfSections, name: "Number of sections", measureWord: "section", measureWords: "sections")
            ConfigView(value: $numberOfCharactersPerSection, name: "Number of characters per section", measureWord: "character", measureWords: "characters")
            
            GroupBox {
                HStack {
                    VStack {
                        HStack {
                            Text("Separator: ")
                            
                            TextField("separator", text: $separator)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 100)
                            
                            Spacer()
                        }
                        .padding(.leading, 60)
                        
                        BoolConfigView(isOn: $includeUpperCasedLetters, name: "Upper-cased letters")
                            .disabled(includeUpperCasedLetters && !includeLowerCasedLetters && !includeNumbers && !includeSpecialSymbols)
                        BoolConfigView(isOn: $includeLowerCasedLetters, name: "Lower-cased letters")
                            .disabled(!includeUpperCasedLetters && includeLowerCasedLetters && !includeNumbers && !includeSpecialSymbols)
                        BoolConfigView(isOn: $includeNumbers, name: "Numbers")
                            .disabled(!includeUpperCasedLetters && !includeLowerCasedLetters && includeNumbers && !includeSpecialSymbols)
                        BoolConfigView(isOn: $includeSpecialSymbols, name: "Special Symbols")
                            .disabled(!includeUpperCasedLetters && !includeLowerCasedLetters && !includeNumbers && includeSpecialSymbols)
                            .padding(.bottom)
                    }
                }
            }
            .padding(.horizontal, 100)
            .padding(.vertical)
            
            GroupBox {
                HStack {
                    Text(passcode)
                        .padding(.leading, 50)
                    Spacer()
                }
                .padding()
            }
            .padding(.horizontal, 100)
            .onHover { bool in
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(passcode, forType: .string)
                isCopied = bool
            }
            .popover(isPresented: $isCopied) {
                Text("Copied")
                    .padding()
            }
            
            Spacer()
        }
    }
    
}

struct ConfigView: View {
    
    @Binding var value: Double
    
    @State var name: String
    @State var measureWord: String
    @State var measureWords: String
    
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    
                    Text("\(name): ")
                        .padding(.leading, 40)
                    
                    Text({()->String in
                        if value == 1 {
                            return "\(Int(value)) \(measureWord)"
                        } else {
                            return "\(Int(value)) \(measureWords)"
                        }
                    }())
                    
                    Spacer()
                }
                
                Slider(value: $value, in: 1...20, step: 1)
                    .padding(.horizontal, 40)
            }
            .padding(.all)
        }
        .padding(.horizontal, 100)
        .padding(.vertical)
    }
    
}

struct BoolConfigView: View {
    
    @Binding var isOn: Bool
    
    @State var name: String
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text(name)
            }
            .padding(.leading, 60)
            
            Spacer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
