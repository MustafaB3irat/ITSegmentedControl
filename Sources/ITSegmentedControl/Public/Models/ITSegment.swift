//
//  ITSegment.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

/// Configurations for segment
public struct ITSegment {
    let title: String
    var image: UIImage? = nil
    var selectedImage: UIImage? = nil
    var selectedIndicatorColor: UIColor = .black
    var titleColor: UIColor = .label
    var selectedTitleColor: UIColor = .label
    var backgroundColor: UIColor = .clear
    var selectedBackgroundColor: UIColor = .clear
    var borderConfigurations: ITSegmentBorderConfigurations? = nil
    var contentType: ITSegmentContentModeType = .imageFirst
}
