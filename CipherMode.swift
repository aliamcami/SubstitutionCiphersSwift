//
//  Cipher.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 01/01/19.
//

import UIKit

/**
 Defines the behaviour of the cipher class.
 - Force Upercase will apply uppercase to all given text and given alphabet
 - Force Lowercase will apply lowercase to all given text and given alphabet
 - Case Sensitive does not consider uppercase characters equal lowercase characters
 - Case Insenstivie considers uppercase and lowercase letter to be the same
 */
public enum CipherMode{
    case forceUppercase
    case forceLowercase
    case caseInsensitive
    case caseSensitive
}
