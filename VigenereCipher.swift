//
//  VigenereCipher.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 31/12/18.
//

import UIKit

public class VigenereCipher {
    private let key: [Character]
    private let alphabetEnum: SCAlphabet
    private let alphabet: [Character]
    
    public  init(_ alphabet: SCAlphabet = SCAlphabet.forcedUppercased, key: String) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array

        switch self.alphabetEnum {
        case .forcedUppercased:
            self.key = Array(key.uppercased())
        case .forcedLowercased:
            self.key = Array(key.lowercased())
        default:
            self.key = Array(key)
        }
    }
    
    public convenience init(_ alphabet: String, key: String) {
        self.init(SCAlphabet.custom(alphabet), key: key)
    }
    
    public func encipher(_ text: String) -> String{
        var text = text
        
        switch self.alphabetEnum {
        case .forcedUppercased:
            text = text.uppercased()
        case .forcedLowercased:
            text = text.lowercased()
        default:
            break
        }
        let cipher = text.enumerated().map{(index, letter) in
            return cipherLetter(letter, index: index)
        }
        
        return String(cipher)
    }
    
    public func decipher(_ cipher: String) -> String{
        return ""
    }
    
    ///Cipher one letter from this letter position in the text
    ///     - Parameter index: should be this letter index on the original text
    private func cipherLetter(_ letter: Character, index: Int) -> Character{
        let keyIndex = keyIndexFor(index: index)
        
        guard let letterIndex = alphabet.firstIndex(of: letter) else{
            return letter
        }
        
        let newLetterIndex = alphabet.index(letterIndex, shiftedBy: keyIndex)
        return alphabet[newLetterIndex]
    }
    
    private func keyIndexFor(index: Int) -> Int{
        let position = index % key.count
        let letter = key[position]
        let i = alphabet.firstIndex(of: letter)
        return i ?? 0
    }

    
    
    
    
    
    
    
    private func shift(_ text: String, by shift: Int) -> String{
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
