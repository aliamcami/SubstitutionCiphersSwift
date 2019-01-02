//
//  VigenereCipher.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 31/12/18.
//

import UIKit

public class VigenereCipher {
    private let mode: CipherMode
    private let key: [Character]
    private let alphabetEnum: SCAlphabet
    private let alphabet: [Character]
    private typealias cacheType = Dictionary<Character, Dictionary<Character, Character>>
    private var cacheEnchiper = cacheType()
    private var cacheDechiper = cacheType()
    
    public  init(_ alphabet: SCAlphabet = SCAlphabet.uppercased, key: String, mode: CipherMode = .forceUppercase) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array
        self.mode = mode
        
        switch mode {
        case .forceLowercase:
            self.key = Array(key.lowercased())
        case .forceUppercase:
            self.key = Array(key.uppercased())
        default:
            self.key = Array(key)
        }
        
        makeCache()
    }
    
    public convenience init(_ alphabet: String, key: String, mode: CipherMode = .forceUppercase) {
        self.init(SCAlphabet.custom(alphabet), key: key, mode: mode)
    }
    
    public func encipher(_ text: String) -> String{
        let cipher = apply(cacheEnchiper, toText: text)
        
        return String(cipher)
    }
    
    public func decipher(_ cipher: String) -> String{
        let cipher = apply(cacheDechiper, toText: cipher)
        
        return String(cipher)
    }
    
    private func makeCache(){
        for char in key.unique(){
            if let shift = alphabet.firstIndex(of: char){
                let caesar = CaesarCipher(shift: shift, alphabet: self.alphabetEnum, mode: self.mode)
                cacheEnchiper[char] = caesar.cacheEncipher
                cacheDechiper[char] = caesar.cacheDecipher
            }
        }
    }
    
    private func apply(_ cache: cacheType, toText text: String) -> [Character]{
        guard !self.key.isEmpty else{
            return Array(text)
        }
        
        var text = text
        switch mode {
        case .forceLowercase:
            text = text.lowercased()
        case .forceUppercase:
            text = text.uppercased()
        default:
            break
        }
        
        let cipher = text.enumerated().map{(index, letter) in
            return substitute(char: letter, index: index, cache: cache)
        }
        
        return cipher
    }
    
    private func substitute(char: Character, index: Int, cache: Dictionary<Character, Dictionary<Character, Character>>) -> Character{
        
        
        let letterKey = key[index % key.count]
        return cache[letterKey]?[char] ?? char
    }
}
