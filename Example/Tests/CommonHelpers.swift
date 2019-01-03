//
//  CommonHelpers.swift
//  SubstitutionCiphers_Tests
//
//  Created by camila oliveira on 31/12/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

let giantText: String = {
    var base = "abcdefghijklmnopqrstuvw%$#@xyzABCDEFGHI JKLMNOPQRSTUVWXYZ0123456789 "
    for i in 0...14{
        base.append(base)
    }
    
    print("finished base big text: \(base.count) chars")
    return base
}()

let alphabet: String = "abcdefghijklmnopqrstuvw%$#@xyzABCDEFGHI JKLMNOPQRSTUVWXYZ0123456789 \""

var randomShift : Int{
    return Int.random(in: 0...alphabet.count)
}

let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus diam dolor, vitae tempor lacus pellentesque vel. Phasellus in luctus sapien. Aliquam sed libero risus. Nam vitae mattis sem. Curabitur quis urna ut justo porta fringilla efficitur quis metus. Nam rhoncus tortor pharetra nulla pharetra, at tempus quam varius. Aliquam rhoncus, lorem quis egestas varius, lorem felis molestie nisi, vel posuere enim neque non dui. Maecenas ultrices in urna eget egestas. Cras ultrices nisl sed mauris convallis, eget facilisis leo blandit. Cras et quam purus. Donec sed mauris malesuada, rutrum tellus vitae, venenatis orci 9087654321 )(*&ˆ%$#@!<>?:|}{"

let key = "SomeKeyTestCipher)(*&ˆ\\\'9876543ebo974x53twquvyqziuy#!@$Q#IKETSDZDFYJK$Î"
