

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    let parse = Parse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        parse.fetchPopularMovie {
            data in
            self.movies = data
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
        tableView.estimatedRowHeight = 212
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
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
}

