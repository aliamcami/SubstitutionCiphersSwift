# SubstitutionCiphers
[![Version](https://img.shields.io/cocoapods/v/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)
[![License](https://img.shields.io/cocoapods/l/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)
[![Platform](https://img.shields.io/cocoapods/p/SubstitutionCiphers.svg?style=flat)](https://cocoapods.org/pods/SubstitutionCiphers)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

Highly performatic implementation of Caesar cipher and Vigenere cipher for both small and giant amounts of text. 

## Usage
The following examples for caesar and vigenere ciphers are placed at the playground inside the project. 

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
### Cocoapods
SubstitutionCiphers is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SubstitutionCiphers'
```
### Carthage
To integrate SwifterSwift into your Xcode project using Carthage, specify it in your Cartfile:
```
github "aliamcami/SubstitutionCiphersSwift" ~> 0.1.0
```
### Swift Package Manager
You can use The Swift Package Manager to install SwifterSwift by adding the proper description to your Package.swift file:
```
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
    .Package(url: "https://github.com/aliamcami/SubstitutionCiphersSwift", majorVersion: 0.1.0),
    ]
)
```

### Manual
Copy "SubstitutionCiphers/Class" folder to your project and use it. 

# Customization
The default instantiation of the CaesarCipher requires only the shift number, and for the VigenereCipher it will require only the key, but you can customize how the cipher algorithm behave when dealing with the text and the alphabet to be used to encipher your text. 

### Alphabet
SCAlphabet is an enum that represents a set of characters to be the base for the cipher. The enum case are as follow: 
- Printables: ascii character from 32 to 126
- Uppercased: letters A to Z (uppercase)
- Lowercased: letters a to z (lowercase)
- Custom: transforms any custom string to the alphabet, considering only the first occurence of each character

### Cipher Mode
Defines the behaviour of the cipher class as follows:
- ForceUpercase will apply uppercase to all given text and given alphabet
- ForceLowercase will apply lowercase to all given text and given alphabet
- CaseSensitive does NOT consider uppercase characters equal lowercase characters
- CaseInsenstivie considers uppercase and lowercase letter to be the same

For every mode, if the given text contains characters unknow to the alphabet, this characters will remain the same, the cipher will just ignore this unknow characters.  

## License

SubstitutionCiphers is available under the MIT license. See the LICENSE file for more info.
