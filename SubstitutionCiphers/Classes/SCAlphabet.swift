//
//  SCAlphabet.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 31/12/18.
//

import UIKit

public enum SCAlphabet{
    ///All ascii printable characters
    case printables
    ///Apply cipher only to uppercased characters
    case uppercased
    ///Apply cipher only to lowercased characters
    case lowercased
    ///Custom alphabet passed on as string, only unique characters are considered.
    ///   - It will only consider the first occurrence of each character
    case custom(String)
    
    var array: [Character]{
        func getAllUnicodeFrom(first: Int, last: Int) -> [Character]{
            var arr = [Character]()
            for n in first...last{
                if let letter = UnicodeScalar(n){
                    arr.append(Character(letter))
                }
            }
            return arr
        }
        
        switch self {
        case .printables:
            return getAllUnicodeFrom(first: 32, last: 126)
        case .custom(let alph):
            return Array(alph).unique()
        case .uppercased:
            let firstLetter = Int(UnicodeScalar("A").value)
            let lastLetter = Int(UnicodeScalar("Z").value)
            return getAllUnicodeFrom(first: firstLetter, last: lastLetter)
        case .lowercased:
            let firstLetter = Int(UnicodeScalar("a").value)
            let lastLetter = Int(UnicodeScalar("z").value)
            return getAllUnicodeFrom(first: firstLetter, last: lastLetter)
        }
        
    }
}
