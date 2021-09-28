//
//  BeerModel.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import Foundation

struct BeerModel: Decodable {
    
    let id: Int?
    let name: String?
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let imageURL: String?
    let abv: Float?
    let ibu: Float?
    let targetFG: Float?
    let targetOG: Float?
    let ebc: Float?
    let srm: Float?
    let ph: Float?
    let attenuationLevel: Float?
    let volume: Volume?
    let boilVolume: Volume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairings: [String]?
    let brewersTips: String?
    let contributedBy: String?
}


extension BeerModel {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case tagline
        case firstBrewed                    =   "first_brewed"
        case description                    
        case imageURL                       =   "image_url"
        case abv
        case ibu
        case targetFG                       =   "target_fg"
        case targetOG                       =   "target_og"
        case ebc
        case srm
        case ph
        case attenuationLevel               =   "attenuation_level"
        case volume
        case boilVolume                     =   "boil_volume"
        case method
        case ingredients
        case foodPairings                   =   "food_pairing"
        case brewersTips                    =   "brewers_tips"
        case contributedBy                  =   "contributed_by"
    }
}
