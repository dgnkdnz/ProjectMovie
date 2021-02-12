//
//  BaseViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

open class BaseViewController<T: BasePresentProtocol>: UIViewController {
    
    // MARK: - Public Variables
    
    var presenter: T!
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - LifeCycle Methods
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare()
    }
    
    // MARK: - ViewController Methods
    
    open func prepare() {
        // Configure NavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
