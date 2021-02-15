//
//  LocalDataService.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 15.02.2021.
//

import Foundation

protocol UserDefaulsServiceProtocol {
    func add(withId id: Int)
    func any(withId id: Int) -> Bool
    func remove(withId id: Int)
}

final class UserDefaultsService: UserDefaulsServiceProtocol {
    
    static let shared: UserDefaultsService = UserDefaultsService()
    
    private let key = "favoriteMovies"
    
    private init() {
    }
    
    func any(withId id: Int) -> Bool {
        if
            let movies = UserDefaults.standard.object(forKey: self.key) as? [Int],
            let _ = movies.firstIndex(where: { $0 == id }) {
            return true
        }
        return false
    }
    
    func add(withId id: Int) {
        if var movies = UserDefaults.standard.object(forKey: self.key) as? [Int] {
            movies.append(id)
            UserDefaults.standard.set(movies, forKey: self.key)
        } else {
            UserDefaults.standard.set([id], forKey: self.key)
        }
    }
    
    func remove(withId id: Int) {
        if var movies = UserDefaults.standard.object(forKey: self.key) as? [Int] {
            movies = movies.filter({ $0 != id })
            UserDefaults.standard.set(movies, forKey: self.key)
        }
    }
}
