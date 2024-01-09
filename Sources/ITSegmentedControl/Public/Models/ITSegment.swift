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
    var image: UIImage?
    var selectedImage: UIImage?
    let selectedIndicatorColor: UIColor
    let titleColor: UIColor
    let selectedTitleColor: UIColor
    let backgroundColor: UIColor
    let selectedBackgroundColor: UIColor
    var borderConfigurations: ITSegmentBorderConfigurations?
    let contentType: ITSegmentContentModeType
    
    public init(title: String, image: UIImage? = nil, selectedImage: UIImage? = nil, selectedIndicatorColor: UIColor = .black, titleColor: UIColor = .label, selectedTitleColor: UIColor = .label, backgroundColor: UIColor = .clear, selectedBackgroundColor: UIColor = .clear, borderConfigurations: ITSegmentBorderConfigurations? = nil, contentType: ITSegmentContentModeType = .imageFirst) {
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
