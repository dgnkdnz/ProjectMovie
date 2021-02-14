//
//  BaseButton.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 13.02.2021.
//

import UIKit

open class BaseButton: UIButton {
    @IBInspectable
    var localizationKey: String? {
        didSet {
            guard let key = self.localizationKey else { return }
            self.setTitle(NSLocalizedString(key, comment: ""), for: .normal)
        }
    }
}
