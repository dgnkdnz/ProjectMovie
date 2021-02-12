//
//  MovieService.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

public protocol MovieServiceProtocol {
    
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies>) -> Void)
    func getMovieDetails(completion: @escaping (Result<Movie>) -> Void)
}

public final class MovieService: MovieServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies>) -> Void) {
        let urlString = String(format: "%@movie/popular/?language=en-US&api_key=%@&page=%d",
                               ServiceConstants.endpointAPI,
                               ServiceConstants.apiKey,
                               page
                               )
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard
                error == nil,
                let data = data
            else {
                completion(.failure(Error.serializationError(internal: error! )))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PopularMovies.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(Error.serializationError(internal: error)))
            }
        }
        
        task.resume()
    }
    
    public func getMovieDetails(completion: @escaping (Result<Movie>) -> Void) {
        #warning("to do")
    }
}
