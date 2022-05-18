//
//  MainViewController.swift
//  Movie
//
//  Created by Lampa on 09.05.2022.
//

import UIKit



class MainViewController: UIViewController {

@IBOutlet weak var tableView: UITableView!
    
var movied = [Result]()
    
let parse = Parse()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        parse.fetchPopularMovie {
            data in
            self.movied = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
   //     tableView.rowHeight = UITableView.automaticDimension
      //  tableView.estimatedRowHeight = 10
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
  
}

}

    
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movied.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        cell.titleMovie.text = movied[indexPath.row].originalTitle
        cell.overviewMovie.text = movied[indexPath.row].overview
        cell.releaseMovie.text = movied[indexPath.row].releaseDate
        
        let urlString = "https://image.tmdb.org/t/p/w500/"+(movied[indexPath.row].posterPath)
        
        let url = URL(string: urlString)
        cell.imageMovie.downloaded(from: url!)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDescription", sender: indexPath)
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return  200
          }
    */
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let destination = segue.destination as? SecondViewController {
         destination.moveOpen = movied[(tableView.indexPathForSelectedRow?.row)!]
     }

 }
    
}
    

