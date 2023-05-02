//
//  Rational.swift
//  Recipes
//
//  Created by Ash on 02/05/2023.
//

import Foundation

struct Rational {
    static func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        if a == 0 { return b}
        if b == 0 { return a}
        
        return greatestCommonDivisor(b, a % b)
    }
}
