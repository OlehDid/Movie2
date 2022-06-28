//
//  Parse.swift
//  Movie
//
//  Created by Lampa on 16.05.2022.
//

import Foundation
/*
class Parse {
    func fetchPopularMovie(complation: @escaping ([Movie])->()) {

       let urlString = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ed0957c3c3f2acb89d27b394e9612d5e&language=en-US&page=1")
     
       URLSession.shared.dataTask(with: urlString!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(PopularMovieData.self, from: data!)
                complation(result.results)
            } catch {
            }
        } .resume()
    }
}
*/

class Parse {

    
    func fetchPopularMovie(page: Int, complation: @escaping ([Movie])->()) {

  let urlString = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ed0957c3c3f2acb89d27b394e9612d5e&language=en-US&page=\(page)")
        
        URLSession.shared.dataTask(with: urlString!) { data, response, error in
     
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(PopularMovieData.self, from: data!)
                complation(result.results)
            } catch { 
            }
        } .resume()
    }
}

