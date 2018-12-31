import XCTest
@testable import SubstitutionCiphers

fileprivate let giantText: String = {
    var base = "abcdefghijklmnopqrstuvw%$#@xyzABCDEFGHI JKLMNOPQRSTUVWXYZ0123456789 "
    for i in 0...9{
        base.append(base)
    }
    
    return base
}()

fileprivate let alphabet: String = "abcdefghijklmnopqrstuvw%$#@xyzABCDEFGHI JKLMNOPQRSTUVWXYZ0123456789 \""

class Tests: XCTestCase {
    //MARK: HELPERS
    var randomShift : Int{
        return Int.random(in: 0...alphabet.count)
    }
    
    let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. 9087654321 )(*&ˆ%$#@!<>?:|}{"

    
    //MARK:- CAESAR TESTS
 
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
    
    //MARK: Performance
    func testCaesarPerformance(){
        let b = giantText
        let caesar = CaesarCipher()
        let shift = randomShift
        
        self.measure {
            _ = caesar.encipher(b, shiftBy: shift)
        }
    }
    
    //MARK: Helpers
    func caesarEncipherDecipher(by shift: Int, caesar: CaesarCipher){
        let cipher = caesar.encipher(text, shiftBy: shift)
        XCTAssertNotEqual(cipher, text)
        let decipher = caesar.decipher(cipher, shiftBy: shift)
        XCTAssertEqual(decipher, text)
    }
    
    //MARK:- VEGENERE TESTS
    func testVigenerePerformance(){
        let key = "SomeKeyTestCipher)(*&ˆ\\\'"
        let b = giantText
        let vigenere = VigenereCipher(alphabet, key: key)
        self.measure {
            _ = vigenere.encipher(b)
        }
    }
    
    
    //MARK: Helpers
    func vigenereEncipherDecipher(vigenere: VigenereCipher){
        let cipher = vigenere.encipher(text)
        XCTAssertNotEqual(cipher, text)
        let decipher = vigenere.decipher(cipher)
        XCTAssertEqual(decipher, text)
    }
    
}
