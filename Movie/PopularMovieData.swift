//
//  PopularMovieData.swift
//  Movie
//
//  Created by Lampa on 10.05.2022.
//

import Foundation

struct PopularMovieData: Decodable {
    let results: [Result]
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
      
}

struct Result: Decodable {
    let backdropPath: String
    let posterPath: String
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate:String
    let voteAverage: Double
    var voteAveregeString: String {
        return "\(voteAverage)"
    }
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case title, overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}


