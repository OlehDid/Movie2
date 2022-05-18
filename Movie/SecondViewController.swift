//
//  SecondViewController.swift
//  Movie
//
//  Created by Lampa on 09.05.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageSecond: UIImageView!
    @IBOutlet weak var overviewSecond: UILabel!
    @IBOutlet weak var titleSecond: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    var moveOpen:Result?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        overviewSecond.text = moveOpen?.overview
        titleSecond.text = moveOpen?.title
        releaseDate.text = moveOpen?.releaseDate
        rating.text = moveOpen?.voteAveregeString
        
        let urlString = "https://image.tmdb.org/t/p/w1280/"+(moveOpen?.backdropPath)!
        let url = URL(string: urlString)
        imageSecond.downloaded(from: url!)
    }
 
    @IBAction func alertAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Movie name is", message: "\(String(describing: (titleSecond.text)!))", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        
        present(alert, animated: true, completion: nil)
        
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
