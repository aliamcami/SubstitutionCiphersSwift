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

    func testCaesarPerformanceBigText(){
        let b = giantText //278528 chars

        self.measure {
            for _ in 0...10{
                let caesar = CaesarCipher(shift: randomShift)
                _ = caesar.encipher(b)
            }
        }
    }
    
    func testCaesarPerformanceSmallText(){
        let b = text
        self.measure {
            for _ in 0...10{
                let caesar = CaesarCipher(shift: randomShift)
                _ = caesar.encipher(b)
            }
        }
    }
    
    func testVigenerePerformanceBigText(){
        let key = "SomeKeyTestCipher)(*&ˆ\\\'9876543ebo974x53twquvyqziuy#!@$Q#IKETSDZDFYJK$Î"
        let b = giantText
        self.measure {
            for _ in 0...10{
                let vigenere = VigenereCipher(alphabet, key: key)
                _ = vigenere.encipher(b)
            }
        }
    }
    
    func testVigenerePerformanceSmallText(){
        let b = text
        self.measure {
            for _ in 0...10{
                let vigenere = VigenereCipher(alphabet, key: key)
                _ = vigenere.encipher(b)
            }
        }
    }
    
}
