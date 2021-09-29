//
//  BeerListTableViewCell.swift
//  Brewery
//
//  Created by Vikas Dalvi  on 28/09/21.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var taglineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setListItemData(_ imageURL: URL?,
                         title: String?,
                         tagline: String?) {
        
//        if let url = imageURL,
//           let data = try? Data(contentsOf: url) {
//            itemImageView.image = UIImage(data: data)
//        }
        
        self.titleLabel.text = title
        self.taglineLabel.text = tagline
    }
}
