//
//  Double+Extensions.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 16/01/22.
//

import Foundation

extension Double {
    func divideBy1000() -> Double{
        return Double((Int(self) % 100) / 10)
    }
}
