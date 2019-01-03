//
//  ViewController.swift
//  SubstitutionCiphers
//
//  Created by Camila Resende on 12/31/2018.
//  Copyright (c) 2018 Camila Resende. All rights reserved.
//

import UIKit
import SubstitutionCiphers

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

