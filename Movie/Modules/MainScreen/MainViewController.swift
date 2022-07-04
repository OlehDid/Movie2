

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var movies = [Movie]()
    private let parse = ApiSetting()
    private var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getMovies()
        updateTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 212
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getMovies() {
        parse.fetchPopularMovie(page: page) {
            [weak self] result in
            if let result = result {
                self?.movies = result
                self?.reloadTableView()
            } else {
                print("error")
            }
        }
    }
    
    func updateTableView() {
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
        vc.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            page += 1
            print(page)
            parse.fetchPopularMovie(page: page) {[weak self] result in
                if let result = result {
                    self?.movies.append(contentsOf: result)
                    self?.reloadTableView()
                } else {
                    print("error")
                }
            }
        }
    }
}




