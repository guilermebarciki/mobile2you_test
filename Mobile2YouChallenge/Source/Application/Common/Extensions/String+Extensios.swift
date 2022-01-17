//
//  String+Extensios.swift
//  Mobile2YouChallenge
//
//  Created by Guilerme Barciki on 16/01/22.
//

import Foundation

extension String {
    func getInitialCharacters(_ howManyCharacters: Int) -> String {
        
        if self.count < howManyCharacters {
            fatalError("string invalid")
            return self
        }
        
        var aux = ""
        for char in self{
            aux.append(char)
            if aux.count == howManyCharacters {
                return aux
            }
        }
        
        return self
    }
}
