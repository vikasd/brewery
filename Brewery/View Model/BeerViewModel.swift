//
//  BeerViewModel.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import Foundation
import UIKit

struct BeerViewModel {
    
    private let beer: BeerModel
    
    init(_ beer: BeerModel) {
        self.beer = beer
    }
    
    var id: Int? { self.beer.id }
    var name: String? { self.beer.name }
    var description: String? { self.beer.description }
    
    var tagline: String? {
        
        if let tagline = self.beer.tagline {
            return "\"" + tagline + "\""
        }
        return nil
    }
    
    var firstBrewed: String? { self.beer.firstBrewed }
    var imageURL: URL? { URL(string: self.beer.imageURL ?? "") }
    
    var abv: String? {
        
        guard let abv = self.beer.abv else {
            return nil
        }
        
        return String(format: "%.2f", abv)
    }
    
    var ibu: String? {
        
        guard let ibu = self.beer.ibu else { return nil }
        
        return String(format: "%.2f", ibu)
    }
    
    var targetFG: String? {
        
        guard let targetFG = self.beer.targetFG else { return nil }
        
        return String(format: "%.2f", targetFG)
    }
    
    var targetOG: String? {
        
        guard let targetOG = self.beer.targetOG else { return nil }
        
        return String(format: "%.2f", targetOG)
    }
    
    var ebc: String? {
        
        guard let ebc = self.beer.ebc else { return nil }
        return String(format: "%.2f", ebc)
    }
    
    var srm: String? {
        
        guard let srm = self.beer.srm else { return nil }
        return String(format: "%.2f", srm)
    }
    
    var ph: String? {
        
        guard let ph = self.beer.ph else { return nil }
        return String(format: "%.2f", ph)
    }
    
    var attenuationLevel: String? {
        
        guard let attenuationLevel = self.beer.attenuationLevel else { return nil }
        
        return String(format: "%.2f", attenuationLevel)
    }
    
    var details: NSAttributedString? {
        
        let detailTitleString = "Details:"
        
        let string = detailTitleString
            + "\n\n"
            + "ABV: " + (abv ?? "") + "\n"
            + "IBU: " + (ibu ?? "") + "\n"
            + "EBC: " + (ebc ?? "") + "\n"
            + "SRM: " + (srm ?? "") + "\n"
            + "ph: " + (ph ?? "") + "\n"
            + "Target FG: " + (targetFG ?? "") + "\n"
            + "Target OG: " + (targetOG ?? "") + "\n"
            + "Attenuation Level: " + (attenuationLevel ?? "")
        
        
        return getAttributedString(detailTitleString, message: string)
    }
    
    var volume: NSAttributedString? {
        
        guard let volume = self.beer.volume else { return nil }
        
        let volumeString = "Volume:"
        let string = volumeString + " " + String(format: "%.2f %@", volume.value, volume.unit)
        
        return getAttributedString(volumeString, message: string)
    }
    
    var boilVolume: NSAttributedString? {
        
        guard let volume = self.beer.boilVolume else { return nil }
        
        let volumeString = "Boil Volume:"
        let string = volumeString + " " + String(format: "%.2f %@", volume.value, volume.unit)
        
        return getAttributedString(volumeString, message: string)
    }
    
    var method: NSAttributedString? {
        
        let methodTitleString = "Method:"
        
        let mashing = (self.beer.method?.mashes ?? []).map { String(format: "at %.2f %@ for %d min", $0.temperature.value, $0.temperature.unit, $0.duration ?? 0) }.joined(separator: ",\n")
        
        let mashString = "Mash:\n" + mashing
        
        let fermentation = "Fermentation:\n" + String(format: "%.2f %@", self.beer.method?.fermentation.temperature.value ?? 0, self.beer.method?.fermentation.temperature.unit ?? "")
        
        let twistString = "Twist:\n" + (self.beer.method?.twist ?? "")
        
        let string = methodTitleString + "\n\n"
            + mashString + "\n\n"
            + fermentation + "\n\n"
            + twistString
        
        return getAttributedString(methodTitleString, message: string)
    }
    
    var ingredients: NSAttributedString? {
        
        let title = "Ingredients:"
        
        let malts = (self.beer.ingredients?.malt ?? []).map { String(format: "%@ %.2f %@", $0.name ?? "", $0.amount?.value ?? 0, $0.amount?.unit ?? "") }
            .joined(separator: ",\n")
        
        let maltsString = "Malts:\n\n" + malts
        
        let hops = (self.beer.ingredients?.hops ?? []).map { String(format: "%@ %.2f %@", $0.name ?? "", $0.amount?.value ?? 0, $0.amount?.unit ?? "") }.joined(separator: ",\n")
        
        let hopString = "Hops:\n\n" + hops
        
        let yeastString = "Yeast:\n\n" + (self.beer.ingredients?.yeast ?? "")
        
        let string = title + "\n\n"
        + maltsString + "\n\n"
        + hopString + "\n\n"
        + yeastString
        
        return getAttributedString(title, message: string)
    }
    
    var foodPairing: NSAttributedString? {
        
        let title = "Food Pairing:"
        
        let options = (self.beer.foodPairings ?? []).joined(separator: ",\n")
        
        let message = title + "\n\n"
        + options
        
        return getAttributedString(title, message: message)
    }
    
    var brewersTip: NSAttributedString? {
        
        let title = "Brewers Tip:"
        
        let message = title + "\n\n" + (self.beer.brewersTips ?? "")
        
        return getAttributedString(title, message: message)
    }
    
    var contributor: NSAttributedString? {
        
        let title = "Contributor:"
        
        let message = title + "\n\n" + (self.beer.contributedBy ?? "")
        
        return getAttributedString(title, message: message)
    }
    
    func getAttributedString(_ title: String, message: String) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: message,
                                                         attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
                                                                      NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold),
                                        NSAttributedString.Key.foregroundColor : UIColor.black],
                                       range: (message as NSString).range(of: title))
        return attributedString
    }
}
