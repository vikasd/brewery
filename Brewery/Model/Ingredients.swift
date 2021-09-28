//
//  Ingredients.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import Foundation

struct Ingredients: Decodable {
    
    let malt: [Malt]?
    let hops: [Hops]?
    let yeast: String?
}



// MARK: Malt
struct Malt: Decodable {
 
    let name: String?
    let amount: Weight?
}


// MARK: Hops
struct Hops: Decodable {
    
    let name: String?
    let amount: Weight?
    let add: String?
    let attribute: String?
}
