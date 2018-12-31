//
//  CaesarCipher.swift
//  CaeserCipher
//
//  Created by camila oliveira on 15/11/18.
//

import UIKit


public class CaesarCipher{
    private let alphabetEnum: SCAlphabet
    private let alphabet: [Character]
    
    public  init(_ alphabet: SCAlphabet = SCAlphabet.forcedUppercased) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array
    }
    
    public convenience init(_ alphabet: String) {
        self.init(SCAlphabet.custom(alphabet))
    }
    
    public func encipher(_ text: String, shiftBy: Int) -> String{
        return shift(text, by: shiftBy)
    }
    
    public func decipher(_ cipher: String, shiftBy: Int) -> String{
        return shift(cipher, by: -shiftBy)
    }
    
    func shift(_ text: String, by shift: Int) -> String{
        var text = text
        
        switch self.alphabetEnum {
        case .forcedUppercased:
            text = text.uppercased()
        case .forcedLowercased:
            text = text.lowercased()
        default:
            break
        }
        
        var cache = Dictionary<Character, Character>()
        for (index, char) in alphabet.enumerated(){
            let newIndex = alphabet.index(index, shiftedBy: shift)
            cache[char] = alphabet[newIndex]
        }
        
        let cipher = text.map({return cache[$0] ?? $0})
        return String(cipher)
    }
}


