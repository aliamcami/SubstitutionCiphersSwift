//
//  VigenereTests.swift
//  SubstitutionCiphers_Tests
//
//  Created by camila oliveira on 31/12/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SubstitutionCiphers

class VigenereTests: XCTestCase {
    func testVigenere(){
        let text = "ABCDE"
        let alphabet = "ABCDE"
        let key = "ABC"
        let expectedCipher = "ACEDA"
        let vigenere = VigenereCipher(alphabet, key: key, mode: .forceUppercase)
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, expectedCipher)
        XCTAssertEqual(text, vigenere.decipher(cipher))
    }
    
    
    func testEncipherDecipher_biggerKey(){
        let key = "the key has more unique chars than the text $%ˆ&*()"
        let vigenere = VigenereCipher(.printables, key: key, mode: .caseSensitive)
        self.vigenereEncipherDecipher(vigenere: vigenere, text: "less unique chars")
    }
    
    func testEncipherDecipher_smallerKey(){
        let key = "less unique chars"
        let vigenere = VigenereCipher(.printables, key: key, mode: .caseSensitive)
        self.vigenereEncipherDecipher(vigenere: vigenere, text: "the text has more unique chars than the text $%ˆ&*()")
    }
    
    func testEncipherDecipherVigenereNoKey(){
        let vigenere = VigenereCipher(key: "")
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    
    func testVigenereModeForcedLowercase(){
        let vigenere = VigenereCipher(key: key, mode: .forceLowercase)
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, cipher.lowercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(text.lowercased(), decipher)
        XCTAssertNotEqual(text, decipher)
    }
    
    func testCaesarModeForcedUpercase(){
        let vigenere = VigenereCipher(key: key, mode: .forceUppercase)
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, cipher.uppercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(text.uppercased(), decipher)
        XCTAssertNotEqual(text, decipher)
    }
    
    func testVigenereModeCaseInsensitive(){
        let text = "TEx ()"
        let vigenere = VigenereCipher("teX", key: "Ex", mode: .caseInsensitive)
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(text, decipher)
    }
    
    func testCaesarModeCaseSensitive(){
        let text = "TExT ()"
        let vigenere = VigenereCipher("teX", key: "E", mode: .caseSensitive)
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(text, decipher)
    }
    
    func testCaesarModeCaseSensitive2(){
        let text = "TExT ()"
        let vigenere = VigenereCipher("teX", key: "eX", mode: .caseSensitive)
        let cipher = vigenere.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(text, decipher)
    }
    
    func testAlphabetPlus(){
        //test case in which the alphabet containts character that the text does not
        let vigenere = VigenereCipher("abcde", key: "eX")
        let text = "abab"
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    
    func testAlphabetMinus(){
        //test case in which the text containts character that the alphabet does not
        let vigenere = VigenereCipher("ab", key: "eX")
        let text = "abcdef"
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    
    //MARK: Helpers
    func vigenereEncipherDecipher(vigenere: VigenereCipher, text: String = text){
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    

}
