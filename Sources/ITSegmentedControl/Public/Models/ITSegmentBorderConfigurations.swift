//
//  ITSegmentBorderConfigurations.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

/// Border configurations, if set selected indicator will not appear as the border takes control now.
public struct ITSegmentBorderConfigurations {
    let borderColor: UIColor
    var selectedBorderColor: UIColor? = nil
    let borderWidth: CGFloat
    
    public init(borderColor: UIColor, selectedBorderColor: UIColor? = nil, borderWidth: CGFloat) {
        self.borderColor = borderColor
        self.selectedBorderColor = selectedBorderColor
        self.borderWidth = borderWidth
    }
}
