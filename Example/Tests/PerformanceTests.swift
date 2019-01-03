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

    //0.001
    func testCaesarPerformanceBigText(){
        let b = giantText
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift)
        
        self.measure {
            for _ in 0...10{
                _ = caesar.encipher(b)
            }
        }
    }
    
    //2.538
    func testVigenerePerformanceBigText(){
        let key = "SomeKeyTestCipher)(*&ˆ\\\'9876543ebo974x53twquvyqziuy#!@$Q#IKETSDZDFYJK$Î"
        let b = giantText
        let vigenere = VigenereCipher(alphabet, key: key)
        self.measure {
            for _ in 0...10{
                _ = vigenere.encipher(b)
            }
        }
    }
    
    //0.001
    func testCaesarPerformanceSmallText(){
        let b = text
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift)
        
        self.measure {
            for _ in 0...10{
                _ = caesar.encipher(b)
            }
        }
    }
    
    //0.007
    func testVigenerePerformanceSmallText(){
        let b = text
        let vigenere = VigenereCipher(alphabet, key: key)
        self.measure {
            for _ in 0...10{
                _ = vigenere.encipher(b)
            }
        }
    }
    
}
