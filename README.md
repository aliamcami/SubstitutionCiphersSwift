# SubstitutionCiphers
[![Version](https://img.shields.io/cocoapods/v/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)
[![License](https://img.shields.io/cocoapods/l/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)
[![Platform](https://img.shields.io/cocoapods/p/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)

Implementation of Caesar cipher and Vigenere cipher

## Usage
### Caesar cipher
- Import the pod to your file;
- Instantiate the CaesarCipher (for more info about the possible custom setup read [here](#Customization))
- Use instance functions "encipher" to encipher a given text and "decipher" to decipher a given text

```
import SubstitutionCiphers
...

let caesar = CaesarCipher(shift: 3)
let encipheredText = caesar.encipher("Text to be enciphered")
let decipheredText = caesar.decipher("Text to be deciphered")

...
```

To encipher/decipher using a different shift you will need a new instance of the caesar cipher

### Vigenere cipher
- Import the pod to your file;
- Instantiate the VigenereCipher (for more info about the possible custom setup read [here](#Customization))
- Use instance functions "encipher" to encipher a given text and "decipher" to decipher a given text

```
import SubstitutionCiphers
...

let vigenere = VigenereCipher(key: "SOME KEY")
let textEnciphered = vigenere.encipher("Text to be enciphered")
let textDeciphered = vigenere.decipher("Text to be deciphered")

...
```

To encipher/decipher using a different key you will need a new instance of the vigenere cipher


<!--## Example-->
<!--To run the example project, clone the repo, and run `pod install` from the Example directory first.-->

## Installation

SubstitutionCiphers is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SubstitutionCiphers'
```

# Customization
The default instantiation of the CaesarCipher requires only the shift number, and for the VigenereCipher it will require only the key, but you can customize how the cipher algorithm behave when dealing with the text and the alphabet to be used to encipher your text. 

### Alphabet

### Cipher Mode

## License

SubstitutionCiphers is available under the MIT license. See the LICENSE file for more info.
