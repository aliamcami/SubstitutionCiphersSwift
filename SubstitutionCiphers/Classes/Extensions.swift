//
//  Extensions.swift
//  SubstitutionCiphers
//
//  Created by camila oliveira on 31/12/18.
//

import UIKit

extension Array where Element: Comparable{
    ///Return the given index shifted X positions, should it be greather than the list it will return to the first position like a circular list.
    func index(_ i: Int, shiftedBy shift: Int) -> Int{
        let positions = i + shift
        var new = positions < 0 ? (count - abs(positions) % count) : positions % count
        if new == count { new = 0 }
        
        return new
        
    }
}

extension UnsafeBufferPointer{
    func index(_ i: Int, shiftedBy shift: Int) -> Int{
        let positions = i + shift
        var new = positions < 0 ? (count - abs(positions) % count) : positions % count
        if new == count { new = 0 }
        
        return new
        
    }
}

//Based on: https://stackoverflow.com/questions/27624331/unique-values-of-array-in-swift
extension Sequence where Iterator.Element: Hashable {
    ///Return a sequence with unique characters
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}
