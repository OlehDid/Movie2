//
//  SecondViewController.swift
//  Movie
//
//  Created by Lampa on 09.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var secondImageView: UIImageView!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupImagesViews()
    }
    
    private func setupLabels() {
        overviewLabel.text = movie?.overview
        titleLabel.text = movie?.title
        releaseLabel.text = movie?.releaseDate
        ratingLabel.text = movie?.voteAverageString
    }
    
    private func setupImagesViews() {
        guard let backdropPath = movie?.backdropPath else { return }
        let urlString = Constants.mainURLimage + "w1280/" + backdropPath
        let url = URL(string: urlString)
        secondImageView.sd_setImage(with: url, completed: nil)
    }
    
    @IBAction func alertAction(_ sender: UIButton) {
        let alert = UIAlertController(title: Constants.alertTitle, message: movie?.title, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: Constants.cancel, style: .cancel, handler: nil)
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        present(alert, animated: true, completion: nil)
    }
}

