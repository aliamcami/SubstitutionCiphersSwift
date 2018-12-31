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
        print("b1")
        let vigenere = VigenereCipher(key: "guh")
        print("b2")
//        let cipher = vigenere.encipher("plainTextFUCKING")
//        let decipher = vigenere.decipher(cipher)
//        print(" CIPHER: \(cipher)\nDECIPHER: \(decipher)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

