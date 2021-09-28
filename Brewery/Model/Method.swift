//
//  Method.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import Foundation

struct Method: Decodable {
 
    let mashes: [Mash]
    let fermentation: Fermentation
    let twist: String?
}

extension Method {
    
    enum CodingKeys: String, CodingKey {
        
        case mashes                     =   "mash_temp"
        case fermentation
        case twist
    }
}



// MARK: Mash
struct Mash: Decodable {
    
    let temperature: Temperature
    let duration: Int?
}

extension Mash {
    
    enum CodingKeys: String, CodingKey {
        
        case temperature                    =   "temp"
        case duration
    }
}


// MARK: Fermentation
struct Fermentation: Decodable {
    
    let temperature: Temperature
}

extension Fermentation {
    
    enum CodingKeys: String, CodingKey {
        
        case temperature                    =   "temp"
    }
}
