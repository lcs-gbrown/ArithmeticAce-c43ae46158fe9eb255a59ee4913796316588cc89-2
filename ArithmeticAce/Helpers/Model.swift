//
//  Model.swift
//  ArithmeticAce
//
//  Created by gabi brown on 2022-02-26.
//

import Foundation

struct JsonFile : Encodable {
    let firstValue : Int
    let secondValue : Int
    let answer : Int
    let answerCorrect : Bool
    let trueAnswer : Int
    
}
