//
//  ITSegmentViewModel.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

final class ITSegmentViewModel {
    
    // MARK: - Public Properties
    
    var title: String {
        return segment.title
    }
    
    var image: UIImage? {
        return isSelected ? segment.selectedImage : segment.image
    }
    
    var shouldShowImageView: Bool {
        return image != nil
    }
    
    var selectedIndicatorColor: UIColor {
        return segment.selectedIndicatorColor
    }
    
    var shouldShowSelectionIndicator: Bool {
        return segment.borderConfigurations == nil && isSelected
    }
    
    var shouldHighlightBorder: Bool {
        return segment.borderConfigurations != nil && isSelected
    }
    
    var titleColor: UIColor {
        return isSelected ? segment.selectedTitleColor : segment.titleColor
    }
    
    var backgroundColor: UIColor {
        return isSelected ? segment.selectedBackgroundColor : segment.backgroundColor
    }
    
    var borderWidth: CGFloat {
        guard let configurations = segment.borderConfigurations else {
            return 0
        }
        return isSelected ? 2 : configurations.borderWidth
    }
    
    var borderColor: UIColor {
        guard let configurations = segment.borderConfigurations else {
            return .clear
        }
        let selectedColor = configurations.selectedBorderColor ?? titleColor
        return isSelected ? selectedColor : configurations.borderColor
    }
    
    var contentType: ITSegmentContentModeType {
        return segment.contentType
    }
    
    private(set) var isSelected: Bool
    
    private(set) var segment: ITSegment
    
    // MARK: - LifeCycle
    
    init(segment: ITSegment, isSelected: Bool) {
        self.segment = segment
        self.isSelected = isSelected
    }
    
    // MARK: - Public functions
    
    func updateSegment(_ segment: ITSegment) {
        self.segment = segment
    }
    
    func updateSelection(_ isSelected: Bool) {
        self.isSelected = isSelected
    }
}
