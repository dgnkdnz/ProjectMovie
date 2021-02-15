//
//  MovieDetailInteractor.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 15.02.2021.
//

import Foundation

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    var delegate: MovieDetailInteractorDelegate?
    
    // MARK: - Private Variables
    
    private let userDefaultsService: UserDefaulsServiceProtocol!
    
    // MARK: - Initialization Methods
    
    init(userDefaultsService: UserDefaulsServiceProtocol) {
        self.userDefaultsService = userDefaultsService
    }
    
    // MARK: - Interactor Methods
    
    func load(withId id: Int) {
        let exist = self.userDefaultsService.any(withId: id)
        self.delegate?.handleOutput(.favorite(exist))
    }
    
    func favorite(withId id: Int) {
        let exist = self.userDefaultsService.any(withId: id)
        if exist {
            self.userDefaultsService.remove(withId: id)
        } else {
            self.userDefaultsService.add(withId: id)
        }
        self.delegate?.handleOutput(.favorite(!exist))
    }
}
