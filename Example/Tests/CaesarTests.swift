import XCTest
@testable import SubstitutionCiphers

class Tests: XCTestCase {
    
    func testEncipherDecipher_positive_customAlphabet(){
        let caesar = CaesarCipher(alphabet)
        
        //shift is less than text count
        self.caesarEncipherDecipher(by: text.count/2, caesar: caesar)
        
        //shift is greater than text count
        self.caesarEncipherDecipher(by: text.count/2 + text.count, caesar: caesar)
        
        //shift is exacly text count
        self.caesarEncipherDecipher(by: text.count, caesar: caesar)
    }
    
    func testEncipherDecipher_negative_customAlphabet(){
        let caesar = CaesarCipher(alphabet)
        
        //shift is less than text count
        self.caesarEncipherDecipher(by: -text.count/2, caesar: caesar)
        
        //shift is greater than text count
        self.caesarEncipherDecipher(by: -(text.count/2 + text.count), caesar: caesar)
        
        //shift if exacly text count
        self.caesarEncipherDecipher(by: -text.count, caesar: caesar)
    }
    
    func testEncipherDecipherCaesarZero(){
        let caesar = CaesarCipher(alphabet)
        let cipher = caesar.encipher(text, shiftBy: 0)
        XCTAssertEqual(cipher, text)
        let decipher = caesar.decipher(cipher, shiftBy: 0)
        XCTAssertEqual(decipher, text)
    }
    
    func testCaesarForcedLowercase(){
        let caesar = CaesarCipher(.forcedLowercased)
        let shift = randomShift
        let cipher = caesar.encipher(text, shiftBy: shift)
        XCTAssertEqual(cipher, cipher.lowercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher, shiftBy: shift)
        XCTAssertEqual(text.lowercased(), decipher)
    }
    
    func testCaesarForcedUpercase(){
        let caesar = CaesarCipher(.forcedUppercased)
        let shift = randomShift
        let cipher = caesar.encipher(text, shiftBy: shift)
        XCTAssertEqual(cipher, cipher.uppercased())
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher, shiftBy: shift)
        XCTAssertEqual(text.uppercased(), decipher)
    }

    
    //MARK: Helpers
    func caesarEncipherDecipher(by shift: Int, caesar: CaesarCipher){
        let cipher = caesar.encipher(text, shiftBy: shift)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher, shiftBy: shift)
        XCTAssertEqual(decipher, text)
    }
    
}
