
import UIKit
import SubstitutionCiphers

let vigenere = VigenereCipher(SCAlphabet.forcedLowercased, key: "GAH")
let cipher = vigenere.encipher("PLAINTEXT")
//print(cipher)
