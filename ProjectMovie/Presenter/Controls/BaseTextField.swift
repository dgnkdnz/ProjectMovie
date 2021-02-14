//
//  BaseTextField.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

open class BaseTextField: UITextField {
    @IBInspectable
    var localizationKey: String? {
        didSet {
            guard let key = self.localizationKey else { return }
            self.placeholder = NSLocalizedString(key, comment: "")
        }
    }
}
