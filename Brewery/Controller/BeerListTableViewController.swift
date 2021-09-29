//
//  BeerListTableViewController.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import UIKit

class BeerListTableViewController: UITableViewController {
    
    var beerListViewModel: BeerListViewModel = BeerListViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /// Set up bindings
        bindings()
        
        /// Perform data loading
        beerListViewModel.load()
    }

    func bindings() {
        
        /// BeerListView Model binding
        beerListViewModel.bind { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerListViewModel.numberOfItemsInList()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BeerListTableViewCell.self)) as? BeerListTableViewCell else {
            fatalError("xxxxx BeerListTableViewCell Not Found xxxxx")
        }
        
        let beerViewModel = beerListViewModel.beerItem(at: indexPath.row)
        
        cell.setListItemData(beerViewModel.imageURL,
                             title: beerViewModel.name,
                             tagline: beerViewModel.tagline)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let beerViewModel = beerListViewModel.beerItem(at: indexPath.row)
        
        let detailViewController = BeerDetailsViewController(beerViewModel)
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
