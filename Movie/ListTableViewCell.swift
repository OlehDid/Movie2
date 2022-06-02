//
//  ListTableViewCell.swift
//  Movie
//
//  Created by Lampa on 30.05.2022.
//

import UIKit


class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetContent()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetContent()
    }
    
    private func resetContent() {
        listImageView.image = nil
        titleLabel.text = nil
        overviewLabel.text = nil
        releaseLabel.text = nil
    }
    func update(movie: Movie) {
        titleLabel.text = movie.originalTitle
        overviewLabel.text = movie.overview
        releaseLabel.text = movie.releaseDate
        
        let urlString = mainURL+"w500"+(movie.posterPath)
        let url = URL(string: urlString)
        listImageView.sd_setImage(with: url, completed: nil)
    }
}
