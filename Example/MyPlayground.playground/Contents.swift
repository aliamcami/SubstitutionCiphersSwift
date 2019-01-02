
import UIKit
import SubstitutionCiphers

//let vigenere = VigenereCipher(SCAlphabet.forcedLowercased, key: "GAH")
//let cipher = vigenere.encipher("PLAINTEXT")
//let decipher = vigenere.decipher(cipher)
let key = "erip"
//let alphabet: String = "abcdefghijklmnopqrstuvw%$#@xyzABCDEFGHI JKLMNOPQRSTUVWXYZ0123456789 \""
let alphabet = "Remip"
let text = "Lorem IPsum.9"

let vigenere = VigenereCipher(alphabet, key: key, mode: CipherMode.caseInsensitive)

let cipher = vigenere.encipher(text)
let decipher = vigenere.decipher(cipher)
cipher != text
decipher.lowercased() == text.lowercased()
