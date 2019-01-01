
import UIKit
import SubstitutionCiphers

//let vigenere = VigenereCipher(SCAlphabet.forcedLowercased, key: "GAH")
//let cipher = vigenere.encipher("PLAINTEXT")
//let decipher = vigenere.decipher(cipher)


let caesar = CaesarCipher(shift: 1, alphabet: SCAlphabet.lowercased, mode: CipherMode.caseSensitive)
let cipher = caesar.encipher("testE")
let decipher = caesar.decipher(cipher)
