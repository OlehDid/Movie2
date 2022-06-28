//
//  SecondViewController.swift
//  Movie
//
//  Created by Lampa on 09.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        overviewLabel.text = movie?.overview
        titleLabel.text = movie?.title
        releaseLabel.text = movie?.releaseDate
        ratingLabel.text = movie?.voteAverageString
        
        guard let backdropPath = movie?.backdropPath else { return }
        let urlString = mainURLimage + "w1280/" + backdropPath
        let url = URL(string: urlString)
        secondImageView.sd_setImage(with: url, completed: nil)
    }
    
    @IBAction func alertAction(_ sender: UIButton) {
        let alert = UIAlertController(title: alertTitle, message: movie?.title, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: ok, style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        present(alert, animated: true, completion: nil)
    }
}

