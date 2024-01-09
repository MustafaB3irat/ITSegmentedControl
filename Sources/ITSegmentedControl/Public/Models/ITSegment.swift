//
//  ITSegment.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

/// Configurations for segment
public struct ITSegment {
    public let title: String
    public var image: UIImage?
    public var selectedImage: UIImage?
    public let selectedIndicatorColor: UIColor
    public let titleColor: UIColor
    public let selectedTitleColor: UIColor
    public let backgroundColor: UIColor
    public let selectedBackgroundColor: UIColor
    public var borderConfigurations: ITSegmentBorderConfigurations?
    public let contentType: ITSegmentContentModeType
    
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
