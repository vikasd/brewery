//
//  Units.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import Foundation


protocol Unit: Decodable {
    
    var unit: String { get }
    var value: Double { get }
}

// MARK: Volume Unit
struct Volume: Unit {
    
    var unit: String
    var value: Double
}

// MARK: Temperature Unit
struct Temperature: Unit {
    
    var unit: String
    var value: Double
}

// MARK: Weight
struct Weight: Unit {
    
    var unit: String
    var value: Double
}
