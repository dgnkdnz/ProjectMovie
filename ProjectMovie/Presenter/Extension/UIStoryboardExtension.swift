//
//  UIStoryboardExtension.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

extension UIStoryboard {
    
    convenience init(storyboard: Storyboards) {
        self.init(name: storyboard.rawValue, bundle: nil)
    }
    
    convenience init(storyboard: Storyboards, bundle: Bundle) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController(withStoryboardIdentifiers storyboardIdentifiers: StoryboardIdentifiers) -> UIViewController{
        return self.instantiateViewController(withIdentifier: storyboardIdentifiers.rawValue)
    }
}
