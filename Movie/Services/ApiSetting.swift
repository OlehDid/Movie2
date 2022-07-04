//
//  Parse.swift
//  Movie
//
//  Created by Lampa on 16.05.2022.
//

import Foundation

class ApiSetting {
    
    func fetchPopularMovie(page: Int, complation: @escaping ([Movie]?)->()) {
        
        let urlString = URL(string: "\(Constants.baseURL)?api_key=\(Constants.apiKey)&\(Constants.langpageURL)\(page)")
        URLSession.shared.dataTask(with: urlString!) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(PopularMovieData.self, from: data)
                complation(result.results)
            } catch { print(error)
            }
        } .resume()
    }
}
