//
//  VigenereCipher.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 31/12/18.
//

import UIKit

public class VigenereCipher {
    //MARK: Variables
    private let mode: CipherMode
    private let key: [Character]
    private let alphabetEnum: SCAlphabet
    private let alphabet: [Character]
    private typealias CacheType = Dictionary<Character, Dictionary<Character, Character>>
    private lazy var cacheEnchiper: CacheType = makeCache(encipher: true)
    private lazy var cacheDechiper: CacheType = makeCache(encipher: false)
    
    //MARK:- Public functions
    
    /**
     Initialization with pre-made SCAlphabet, if none is given the default will be A to Z uppercased. If no cipher mode is given the default will be foceUpercase. If a character in the text to be ciphered does not exist in the given alphabet it will remain the same character.
     
     - Parameter alphabet: alphabet that will be used to cipher, only the first occurence of each letter or symbol will be valid. The default alphabet is A-Z uppercased:
        - Upercased is letters A to Z
        - Lowercased is letters a to z
        - Printables are all ascii characters from 32 to 126
        - Custom is any custom string
     - Parameter key: given string key to encipher text
     - Parameter mode: The mode in witch the cipher will behave:
        - Force Upercase will apply uppercase to all given text and given alphabet
        - Force Lowercase will apply lowercase to all given text and given alphabet
        - Case Sensitive does not consider uppercase characters equal lowercase characters
        - Case Insenstivie considers uppercase and lowercase letter to be the same
     */
    public  init(_ alphabet: SCAlphabet = SCAlphabet.uppercased, key: String, mode: CipherMode = .forceUppercase) {
        self.alphabetEnum = alphabet
        self.mode = mode
        self.alphabet = alphabet.array(fromMode: mode)
        
        switch mode {
        case .forceLowercase:
            self.key = Array(key.lowercased())
        case .forceUppercase:
            self.key = Array(key.uppercased())
        default:
            self.key = Array(key)
        }
    }
    
    /**
     Convenience init that accepts an string as alphabet, if none is given the default will be A to Z uppercased. If no cipher mode is given the default will be foceUpercase. If a character in the text to be ciphered does not exist in the given alphabet it will remain the same character.
     
     - Parameter alphabet: alphabet that will be used to cipher, only the first occurence of each letter or symbol will be valid. The default alphabet is A-Z uppercased:
        - Upercased is letters A to Z
        - Lowercased is letters a to z
        - Printables are all ascii characters from 32 to 126
        - Custom is any custom string
     - Parameter key: given string key to encipher text
     - Parameter mode: The mode in witch the cipher will behave:
        - Force Upercase will apply uppercase to all given text and given alphabet
        - Force Lowercase will apply lowercase to all given text and given alphabet
        - Case Sensitive does not consider uppercase characters equal lowercase characters
        - Case Insenstivie considers uppercase and lowercase letter to be the same
     */
    public convenience init(_ alphabet: String, key: String, mode: CipherMode = .forceUppercase) {
        self.init(SCAlphabet.custom(alphabet), key: key, mode: mode)
    }
    
    ///Enciphers a given text using the setup given in the inicialization
    public func encipher(_ text: String) -> String{
        let cipher = apply(cacheEnchiper, toText: text)
        
        return String(cipher)
    }
    
    ///Deciphers a given text using the setup given in the inicialization
    public func decipher(_ cipher: String) -> String{
        let cipher = apply(cacheDechiper, toText: cipher)
        
        return String(cipher)
    }
    
    //MARK:- Private/Helper functions
    /***
    Much like the Caesar cache, it makes the Dictionary representing the new equivalent character for the substitution, but for all possible shifts given the key.
    It means that it is a dictionary of dictionaries, [KeyChar: [originalChar: ShiftedChar]], for both encryption and decryption.
     - KeyChar: contains a single character from the given key
     - OriginalChar: containts a single character from the original alphabet
     - ShiftedChar: contains a single character from the shifted alphabet given the position that the KeyChar is in the original alphabet
     */
    private func makeCache(encipher: Bool) -> CacheType{
        var tmp = CacheType()
        for char in key.unique(){
            if let shift = alphabet.firstIndex(of: char){
                let caesar = CaesarCipher(shift: shift, alphabet: self.alphabetEnum, mode: self.mode)
                tmp[char] = encipher ? caesar.cacheEncipher : caesar.cacheDecipher
            }
        }
        return tmp
    }
    
    ///Applys the substitution of the text characters given a cache
    private func apply(_ cache: CacheType, toText text: String) -> [Character]{
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
    
    ///Calculates the substitute character given that char's position in the original text and the cache to be used.
    private func substitute(char: Character, index: Int, cache: Dictionary<Character, Dictionary<Character, Character>>) -> Character{
        
        
        let letterKey = key[index % key.count]
        return cache[letterKey]?[char] ?? char
    }
}
