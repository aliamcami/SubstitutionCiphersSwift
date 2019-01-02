import XCTest
@testable import SubstitutionCiphers

class Tests: XCTestCase {
    
    func testEncipherDecipher_positive_customAlphabet(){
        
        //shift is less than text count
        let shift1 = text.count/2
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift1, alphabet: alphabet))
        
        //shift is greater than text count
        let shift2 = text.count/2 + text.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift2, alphabet: alphabet))
        
        //shift is exacly text count
        let shift3 = text.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift3, alphabet: alphabet))
    }
    
    func testEncipherDecipher_negative_customAlphabet(){
        //shift is less than text count
        let shift1 = -text.count/2
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift1, alphabet: alphabet))
        
        //shift is greater than text count
        let shift2 = -(text.count/2 + text.count)
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift2, alphabet: alphabet))
        
        //shift if exacly text count
        let shift3 = -text.count
        self.caesarEncipherDecipher(caesar: CaesarCipher(shift: shift3, alphabet: alphabet))
    }
    
    func testEncipherDecipherCaesarZero(){
        let caesar = CaesarCipher(shift: 0, alphabet: alphabet, mode: .caseSensitive)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    
    func testCaesarForcedLowercase(){
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift, alphabet: alphabet, mode: .forceLowercase)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, cipher.lowercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text.lowercased(), decipher)
    }
    
    func testCaesarForcedUpercase(){
        let shift = randomShift
        let caesar = CaesarCipher(shift: shift, alphabet: alphabet, mode: .forceUppercase)
        let cipher = caesar.encipher(text)
        XCTAssertEqual(cipher, cipher.uppercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(text.uppercased(), decipher)
    }
    
    

    
    //MARK: Helpers
    func caesarEncipherDecipher(caesar: CaesarCipher){
        let cipher = caesar.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher)
        XCTAssertEqual(decipher.uppercased(), text.uppercased())
    }
    
}
