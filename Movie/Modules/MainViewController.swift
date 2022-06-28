

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    let parse = Parse()
    var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
      getMovies()
        updateTableView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.update(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.movie = movies[(tableView.indexPathForSelectedRow?.row)!]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 212
        tableView.rowHeight = UITableView.automaticDimension
    }
  
    func getMovies() {
        parse.fetchPopularMovie(page: page) {
            data in
            self.movies = data
            self.movies.append(contentsOf: self.movies)
            DispatchQueue.main.async {
           self.tableView.reloadData()
            }
        }
    }
    
    func updateTableView() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastIndex = movies.count - 1
         if indexPath.row == lastIndex {

             page += 1
             
        
             parse.fetchPopularMovie(page: page) {
                 data in
                 self.movies = data
                 self.movies.append(contentsOf: self.movies)
                 DispatchQueue.main.async {
                 self.tableView.reloadData()
                 }
             }
             
             
            
        }
    }
    
}

