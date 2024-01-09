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
    
    public init(title: String, image: UIImage? = nil, selectedImage: UIImage? = nil, selectedIndicatorColor: UIColor, titleColor: UIColor, selectedTitleColor: UIColor, backgroundColor: UIColor, selectedBackgroundColor: UIColor, borderConfigurations: ITSegmentBorderConfigurations? = nil, contentType: ITSegmentContentModeType) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.selectedIndicatorColor = selectedIndicatorColor
        self.titleColor = titleColor
        self.selectedTitleColor = selectedTitleColor
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.borderConfigurations = borderConfigurations
        self.contentType = contentType
    }
}
