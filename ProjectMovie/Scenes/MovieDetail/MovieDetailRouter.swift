//
//  MovieDetailRouter.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

final class MovieDetailRouter: MovieDetailRouterProtocol {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieDetailRoute) {
        #warning("to do")
    }
}
