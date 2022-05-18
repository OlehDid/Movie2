//
//  ListTableViewCell.swift
//  Movie
//
//  Created by Lampa on 09.05.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var titleMovie: UILabel!
    
    @IBOutlet weak var overviewMovie: UILabel!
    
    @IBOutlet weak var releaseMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
