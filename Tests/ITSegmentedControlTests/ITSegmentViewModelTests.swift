//
//  ITSegmentViewModelTests.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import XCTest
@testable import ITSegmentedControl

final class ITSegmentViewModelTests: XCTestCase {
    
    // MARK: - Segment Properties Tests
    
    func testSegmentTitle() {
        let title = "Title"
        let segment = ITSegment(title: title)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertEqual(viewModel.title, title, "Wrong title")
    }
    
    func testSegmentImage() {
        let image = UIImage(systemName: "list.bullet.rectangle.fill")
        let segment = ITSegment(title: "", image: image)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertEqual(viewModel.image, image, "Wrong image")
    }
    
    func testSegmentSelectedImage() {
        let image = UIImage(systemName: "list.bullet.rectangle.fill")
        let segment = ITSegment(title: "", selectedImage: image)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.image, image, "Wrong image")
    }
    
    func testSegmentTitleColor() {
        let color: UIColor = .blue
        let segment = ITSegment(title: "", titleColor: color)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertEqual(viewModel.titleColor, color, "Wrong title color")
    }
    
    func testSegmentSelectedTitleColor() {
        let color: UIColor = .blue
        let segment = ITSegment(title: "", selectedTitleColor: color)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.titleColor, color, "Wrong selected title color")
    }
    
    func testSegmentSelectedIndicatorColor() {
        let color: UIColor = .blue
        let segment = ITSegment(title: "", selectedIndicatorColor: color)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.selectedIndicatorColor, color, "Wrong selected indicator color")
    }
    
    func testSegmentBackgroundColor() {
        let color: UIColor = .blue
        let segment = ITSegment(title: "", backgroundColor: color)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertEqual(viewModel.backgroundColor, color, "Wrong background color")
    }
    
    func testSegmentSelectedBackgroundColor() {
        let color: UIColor = .blue
        let segment = ITSegment(title: "", selectedBackgroundColor: color)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.backgroundColor, color, "Wrong title color")
    }
    
    func testSegmentBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertEqual(viewModel.borderColor, configurations.borderColor, "Wrong border color")
        XCTAssertEqual(viewModel.borderWidth, configurations.borderWidth, "Wrong border width")
    }
    
    func testSegmentSelectedBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, selectedBorderColor: .black, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.borderColor, configurations.selectedBorderColor, "Wrong border color")
        XCTAssertEqual(viewModel.borderWidth, configurations.borderWidth, "Wrong border width")
    }
    
    func testShouldShowSelectionIndicatorSelectedWithoutBorderConfigurations() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertTrue(viewModel.shouldShowSelectionIndicator, "Wrong behaviour for selection indicator, should show the indicator")
    }
    
    func testShouldShowSelectionIndicatorSelectedWithBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, selectedBorderColor: .black, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertFalse(viewModel.shouldShowSelectionIndicator, "Wrong behaviour for selection indicator, shouldn't show the indicator")
    }
    
    func testShouldShowSelectionIndicatorNotSelectedWithoutBorderConfigurations() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertFalse(viewModel.shouldShowSelectionIndicator, "Wrong behaviour for selection indicator, shouldn't show the indicator")
    }
    
    func testShouldShowSelectionIndicatorNotSelectedWithBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, selectedBorderColor: .black, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertFalse(viewModel.shouldShowSelectionIndicator, "Wrong behaviour for selection indicator, shouldn't show the indicator")
    }
    
    func testShouldShowBorderHighlightingNotSelectedWithoutBorderConfigurations() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertFalse(viewModel.shouldHighlightBorder, "Wrong behaviour for highlight border, shouldn't show the indicator")
    }
    
    func testShouldShowBorderHighlightingSelectedWithoutBorderConfigurations() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertFalse(viewModel.shouldHighlightBorder, "Wrong behaviour for highlight border, shouldn't show the indicator")
    }
    
    func testShouldShowBorderHighlightingNotSelectedWithBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, selectedBorderColor: .black, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertFalse(viewModel.shouldHighlightBorder, "Wrong behaviour for selection indicator, shouldn't show the indicator")
    }
    
    func testShouldShowBorderHighlightingSelectedWithBorderConfigurations() {
        let configurations = ITSegmentBorderConfigurations(borderColor: .red, selectedBorderColor: .black, borderWidth: 1)
        let segment = ITSegment(title: "", borderConfigurations: configurations)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertTrue(viewModel.shouldHighlightBorder, "Wrong behaviour for selection indicator, should show the indicator")
    }
    
    func testSegmentControlContentType() {
        let type: ITSegmentContentModeType = .imageFirst
        let segment = ITSegment(title: "", contentType: type)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.contentType, type, "Content type mismatch")
    }
    
    // MARK: - Select Segment Tests
    
    func testSegmentNotSelectedAtFirstThenSelected() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: false)
        
        XCTAssertFalse(viewModel.isSelected, "Wrong selection, shouldn't be selected")
        
        viewModel.updateSelection(true)
        
        XCTAssertTrue(viewModel.isSelected, "Wrong selection, should be selected")
    }
    
    func testSegmentSelectedAtFirstThenDeselected() {
        let segment = ITSegment(title: "")
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertTrue(viewModel.isSelected, "Wrong selection, should be selected")
        
        viewModel.updateSelection(false)
        
        XCTAssertFalse(viewModel.isSelected, "Wrong selection, shouldn't be selected")
    }
    
    // MARK: - Update Segment Tests
    
    func testUpdateSegment() {
        let oldTitle = "Old"
        let newTitle = "New"
        let segment = ITSegment(title: oldTitle)
        let viewModel = ITSegmentViewModel(segment: segment, isSelected: true)
        
        XCTAssertEqual(viewModel.title, oldTitle, "Wrong title")
        
        viewModel.updateSegment(ITSegment(title: newTitle))
        
        XCTAssertEqual(viewModel.title, newTitle, "Wrong title, not updated")
    }
}
