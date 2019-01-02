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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func vigenereEncipherDecipher(vigenere: VigenereCipher){
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    

}
