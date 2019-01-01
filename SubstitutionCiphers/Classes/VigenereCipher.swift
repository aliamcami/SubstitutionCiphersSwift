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
    private var cacheEnchiper = Dictionary<Character, Dictionary<Character, Character>>()
    private var cacheDechiper = Dictionary<Character, Dictionary<Character, Character>>()
    
    public  init(_ alphabet: SCAlphabet = SCAlphabet.uppercased, key: String, mode: CipherMode = .forceUppercase) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array
        self.key = Array(key)
        self.mode = mode
        
        makeCache()
    }
    
    public convenience init(_ alphabet: String, key: String, mode: CipherMode = .forceUppercase) {
        self.init(SCAlphabet.custom(alphabet), key: key)
    }
    
    public func encipher(_ text: String) -> String{

        let cipher = text.enumerated().map{(index, letter) in
            return encipherLetter(letter, index: index)
        }
        
        return String(cipher)
    }
    
    public func decipher(_ cipher: String) -> String{
        let cipher = cipher.enumerated().map{(index, letter) in
            return decipherLetter(letter, index: index)
        }
        
        return String(cipher)
    }
    
    private func makeCache(){
        for char in key.unique(){
            if let shift = alphabet.firstIndex(of: char){
                cacheEnchiper[char] = makeAlphabet(shiftedBy: shift)
                cacheDechiper[char] = makeAlphabet(shiftedBy: -shift)
            }
        }
    }
    
    private func makeAlphabet(shiftedBy shift: Int) -> Dictionary<Character, Character>{
        var tmp = Dictionary<Character, Character>()
        _ = alphabet.enumerated().map{ (index, char) in
            let newIndex = alphabet.index(index, shiftedBy: shift)
            tmp[char] = alphabet[newIndex]
        }
        return tmp
    }
    
    ///Cipher one letter from this letter position in the text
    ///     - Parameter index: should be this letter index on the original text
    private func encipherLetter(_ letter: Character, index: Int) -> Character{
        return substitute(char: letter, index: index, cache: cacheEnchiper)
    }
    
    private func decipherLetter(_ letter: Character, index: Int) -> Character{
        return substitute(char: letter, index: index, cache: cacheDechiper)
    }
    
    private func substitute(char: Character, index: Int, cache: Dictionary<Character, Dictionary<Character, Character>>) -> Character{
        
        let letterKey = key[index % key.count]
        return cache[letterKey]?[char] ?? char
    }
}
