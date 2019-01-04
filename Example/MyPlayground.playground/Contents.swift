
import UIKit
import SubstitutionCiphers

let TEXT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
//Caesar
let caesar = CaesarCipher(shift: 3)
let encipheredText = caesar.encipher(TEXT)
let decipheredText = caesar.decipher(encipheredText)
print("Enciphered Text: \(encipheredText)")
print("Deciphered Text: \(decipheredText)")

//Vigenere
let vigenere = VigenereCipher(key: "SOME KEY")
let textEnciphered = vigenere.encipher(TEXT)
let textDeciphered = vigenere.decipher(textEnciphered)
print("Enciphered Text: \(textEnciphered)")
print("Deciphered Text: \(textDeciphered)")
