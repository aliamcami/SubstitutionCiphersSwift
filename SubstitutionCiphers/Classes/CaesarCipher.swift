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
    private let mode: CipherMode
    private let shift: Int
    internal var cacheDecipher = Dictionary<Character, Character>()
    internal var cacheEncipher = Dictionary<Character, Character>()
    
    public init(shift: Int, alphabet: SCAlphabet = SCAlphabet.uppercased, mode: CipherMode = .forceUppercase) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array
        self.shift = shift
        self.mode = mode
        
        self.cacheEncipher = makeCache(shiftedBy: self.shift)
        self.cacheDecipher = makeCache(shiftedBy: -self.shift)
    }
    
    public convenience init(shift: Int, alphabet: String, mode: CipherMode = .forceUppercase) {
        self.init(shift: shift, alphabet: SCAlphabet.custom(alphabet), mode: mode)
    }
    
    
    private func makeCache(shiftedBy shift: Int) -> Dictionary<Character, Character>{
        var tmpCache = Dictionary<Character, Character>()
        
        func makeCacheFor(_ alphabet: [Character]){
            for (index, char) in alphabet.enumerated(){
                let newIndex = alphabet.index(index, shiftedBy: shift)
                let newChar = alphabet[newIndex]
                tmpCache[char] = newChar
            }
        }
        
        let alph = String(alphabet)
        
        switch mode {
        case .caseInsensitive:
            let lower = alph.lowercased().unique()
            let upper = String(lower).uppercased().filter { !lower.contains($0)}
            let newAlph : [Character] = "\(String(lower))\(upper)".unique()
            makeCacheFor(newAlph)
        case .forceLowercase:
            makeCacheFor(alph.lowercased().unique())
        case .forceUppercase:
            makeCacheFor(alph.uppercased().unique())
        default:
            makeCacheFor(alphabet)
        }
        
        return tmpCache
    }
    
    
    public func encipher(_ text: String) -> String{
        return  shift(text, by: cacheEncipher)
    }
    
    public func decipher(_ cipher: String) -> String{
        return shift(cipher, by: cacheDecipher)
    }
    
    private func shift(_ text: String, by cache: Dictionary<Character, Character>) -> String{
        var text = text
        switch mode {
        case .forceLowercase:
            text = text.lowercased()
        case .forceUppercase:
            text = text.uppercased()
        default:
            break
        }
        
        let cipher = text.map({return cache[$0] ?? $0})
        return String(cipher)
    }
    
}


