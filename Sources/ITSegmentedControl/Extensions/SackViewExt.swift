//
//  SackViewExt.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubViews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
