//
//  CaesarCipher.swift
//  CaeserCipher
//
//  Created by camila oliveira on 15/11/18.
//

import UIKit

public class CaesarCipher{
    //MARK: Variables
    private let alphabetEnum: SCAlphabet
    private let alphabet: [Character]
    private let mode: CipherMode
    private let shift: Int
    internal var cacheDecipher = Dictionary<Character, Character>()
    internal var cacheEncipher = Dictionary<Character, Character>()
    
    //MARK:- Public functions
    
    /**
    Initialization with pre-made SCAlphabet, if none is given the default will be A to Z uppercased. If no cipher mode is given the default will be foceUpercase. If a character in the text to be ciphered does not exist in the given alphabet it will remain the same character.
    
    - Parameter shift: positive number represents shift to the right, negative to the left
    - Parameter alphabet: alphabet that will be used to cipher, only the first occurence of each letter or symbol will be valid. The default alphabet is A-Z uppercased:
        - Upercased is letters A to Z
        - Lowercased is letters a to z
        - Printables are all ascii characters from 32 to 126
        - Custom is any custom string
     - Parameter mode: The mode in witch the cipher will behave:
        - Force Upercase will apply uppercase to all given text and given alphabet
        - Force Lowercase will apply lowercase to all given text and given alphabet
        - Case Sensitive does not consider uppercase characters equal lowercase characters
        - Case Insenstivie considers uppercase and lowercase letter to be the same
    */
    public init(shift: Int, alphabet: SCAlphabet = SCAlphabet.uppercased, mode: CipherMode = .forceUppercase) {
        self.alphabetEnum = alphabet
        self.alphabet = self.alphabetEnum.array
        self.shift = shift
        self.mode = mode
        
        self.cacheEncipher = makeCache(shiftedBy: self.shift)
        self.cacheDecipher = makeCache(shiftedBy: -self.shift)
    }
    
    /**
     Convenience init that accepts an string as alphabet, if none is given the default will be A to Z uppercased. If no cipher mode is given the default will be foceUpercase. If a character in the text to be ciphered does not exist in the given alphabet it will remain the same character.
     
     - Parameter shift: positive number represents shift to the right, negative to the left
     - Parameter alphabet: alphabet that will be used to cipher, only the first occurence of each letter or symbol will be valid. The default alphabet is A-Z uppercased:
        - Upercased is letters A to Z
        - Lowercased is letters a to z
        - Printables are all ascii characters from 32 to 126
        - Custom is any custom string
     - Parameter mode: The mode in witch the cipher will behave:
        - Force Upercase will apply uppercase to all given text and given alphabet
        - Force Lowercase will apply lowercase to all given text and given alphabet
        - Case Sensitive does not consider uppercase characters equal lowercase characters
        - Case Insenstivie considers uppercase and lowercase letter to be the same
     */
    public convenience init(shift: Int, alphabet: String, mode: CipherMode = .forceUppercase) {
        self.init(shift: shift, alphabet: SCAlphabet.custom(alphabet), mode: mode)
    }
    
    ///Enciphers a given text using the setup given in the inicialization
    public func encipher(_ text: String) -> String{
        return  shift(text, by: cacheEncipher)
    }
    
    ///Deciphers a given text using the setup given in the inicialization
    public func decipher(_ cipher: String) -> String{
        return shift(cipher, by: cacheDecipher)
    }
    
    //MARK:- Private/helpers functions
    
    ///Makes the Dictionary representing the new equivalent character for the substitution [originalChar: ShiftedChar], for both encryption and decryption.
    private func makeCache(shiftedBy shift: Int) -> Dictionary<Character, Character>{
        var tmpCache = Dictionary<Character, Character>()
        
        ///Produces and stores a shifted alphabet given the alphabet, wich can be different depending on the Cipher Mode
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
    
    ///Makes new text using the cache dictionary as replacements for the original text characters.
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


