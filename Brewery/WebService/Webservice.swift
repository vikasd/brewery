//
//  Webservice.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 29/09/21.
//

import Foundation


final class Webservice {
    
    func load(_ url: URL,
              completionHandler: @escaping (Result<[BeerViewModel], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            if let data = data {
                
                let beerModels = try! JSONDecoder().decode([BeerModel].self, from: data)
                let beerViewModels = beerModels.map { BeerViewModel($0) }
                completionHandler(.success(beerViewModels))
                
            } else {
                completionHandler(.success([]))
            }
            
        }.resume()
    }
}
