//
//  BaseLabel.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

open class BaseLabel: UILabel {
    @IBInspectable
    var localizationKey: String? {
        didSet {
            guard let key = self.localizationKey else { return }
            self.text = NSLocalizedString(key, comment: "")
        }
    }
}
