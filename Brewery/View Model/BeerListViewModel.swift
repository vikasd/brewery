//
//  BeerListViewModel.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 29/09/21.
//

import Foundation

class BeerListViewModel {
    
    private let URL: String = "https://api.punkapi.com/v2/beers"
    private var beerListItems: [BeerViewModel] = []
    private var refreshList: (() -> Void)?
    
    func bind(_ refreshList: @escaping () -> Void) {
        self.refreshList = refreshList
    }
    
    func numberOfItemsInList() -> Int { beerListItems.count }
    
    func beerItem(at index: Int) -> BeerViewModel { beerListItems[index] }
}


// MARK: Load Data
extension BeerListViewModel {
    
    func load(_ page: Int? = nil) {
     
        var urlComponent = URLComponents(string: URL)
        
        if let page = page {
            urlComponent?.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        }
        
        guard let url = urlComponent?.url else { return }
        
        Webservice().load(url) {[weak self] result in
            
            switch result {
            
            case .success(let beerViewModels):
                self?.beerListItems.append(contentsOf: beerViewModels)
                
                DispatchQueue.main.async {
                    self?.refreshList?()
                }
            
            case .failure(let error):
                print("Error ===> \(error)")
            }
        }
    }
}
