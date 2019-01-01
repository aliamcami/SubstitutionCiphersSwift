//
//  PerformanceTests.swift
//  SubstitutionCiphers_Tests
//
//  Created by camila oliveira on 31/12/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SubstitutionCiphers

class PerformanceTests: XCTestCase {

    //Should be about 0.3 sec for 500k characters and 1 sec for 2.2kk
    func testCaesarPerformanceBigText(){
        let b = giantText
        let caesar = CaesarCipher()
        let shift = randomShift
        
        self.measure {
            _ = caesar.encipher(b, shiftBy: shift)
        }
    }
    
    //Should be under 0.6 sec for 500k characters, and 1.9 sec for 2.2kk
    func testVigenerePerformanceBigText(){
        let key = "SomeKeyTestCipher)(*&ˆ\\\'9876543ebo974x53twquvyqziuy#!@$Q#IKETSDZDFYJK$Î"
        let b = giantText
        let vigenere = VigenereCipher(alphabet, key: key)
        self.measure {
            _ = vigenere.encipher(b)
        }
    }
    
    //Should be about 0.001 sec for 1k characters
    func testCaesarPerformanceSmallText(){
        let b = text
        
        let caesar = CaesarCipher()
        let shift = randomShift
        
        self.measure {
            _ = caesar.encipher(b, shiftBy: shift)
        }
    }
    
    //Should be about 0.001 sec for 1k characters
    func testVigenerePerformanceSmallText(){
        let b = text
        let vigenere = VigenereCipher(alphabet, key: key)
        self.measure {
            _ = vigenere.encipher(b)
        }
    }
    
}
