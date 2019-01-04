import XCTest
@testable import SubstitutionCiphers

class Tests: XCTestCase {
    
    func testCaesarCipher(){
        let text = "ABCDE"
        let alphabet = "ABCDE"
        let shift = 2
        let expectedCipher = "CDEAB"
        let caesar = CaesarCipher(shift: shift, alphabet: alphabet)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, expectedCipher)
        XCTAssertEqual(text, caesar.decipher(cipher))
    }
    
    func testEncipherDecipher_positive_customAlphabet(){
        
        //shift is less than alphabet count
        let shift1 = alphabet.count/2
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift1, alphabet: alphabet))
        
        //shift is greater than alphabet count
        let shift2 = alphabet.count/2 + text.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift2, alphabet: alphabet))
        
        //shift is exacly alphabet count
        let shift3 = alphabet.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift3, alphabet: alphabet))
    }
    
    func testEncipherDecipher_negative_customAlphabet(){
        //shift is less than alphabet count
        let shift1 = -alphabet.count/2
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift1, alphabet: alphabet))
        
        //shift is greater than alphabet count
        let shift2 = -(alphabet.count/2 + text.count)
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift2, alphabet: alphabet))
        
        //shift if exacly alphabet count
        let shift3 = -alphabet.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift3, alphabet: alphabet))
    }
    
    func testEncipherDecipherCaesarZero(){
        let caesar = CaesarCipher(shift: 0, alphabet: alphabet, mode: .caseSensitive)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    
    func testCaesarModeForcedLowercase(){
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift, alphabet: alphabet, mode: .forceLowercase)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, cipher.lowercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text.lowercased(), decipher)
    }
    
    func testCaesarModeForcedUpercase(){
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift, alphabet: alphabet, mode: .forceUppercase)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, cipher.uppercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text.uppercased(), decipher)
    }
    
    func testCaesarModeCaseInsensitive(){
        let shift = randomShift
        let text = "TEx ()"
        let caesar = CaesarCipher(shift: shift, alphabet: "teX", mode: .caseInsensitive)
        let cipher = caesar.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text, decipher)
    }
    
    func testCaesarModeCaseSensitive(){
        let shift = randomShift
        let text = "TExT ()"
        let caesar = CaesarCipher(shift: shift, alphabet: "teX", mode: .caseSensitive)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text, decipher)
    }
    
    func testAlphabetPlus(){
        //test case in which the alphabet containts character that the text does not
        let caesar = CaesarCipher(shift: randomShift, alphabet: "abcde")
        let text = "abab"
        let cipher = caesar.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    
    func testAlphabetMinus(){
        //test case in which the text containts character that the alphabet does not
        let caesar = CaesarCipher(shift: randomShift, alphabet: "ab")
        let text = "abcdef"
        let cipher = caesar.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    

    
    //MARK: Helpers
    func caesarEncipherDecipher(caesar: CaesarCipher){
        let cipher = caesar.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    
}
