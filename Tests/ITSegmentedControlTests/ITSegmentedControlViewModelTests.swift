import XCTest
@testable import ITSegmentedControl

final class ITSegmentedControlViewModelTests: XCTestCase {
    func testAddSegment() throws {
        let viewModel = ITSegmentedControlViewModel()
        XCTAssertTrue(viewModel.segments.isEmpty, "Invalid started not empty")
        let segmentID = "Test1"
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments.last?.title, segmentID, "Not added to last")
    }
    
    func testAddSegments() throws {
        let viewModel = ITSegmentedControlViewModel()
        XCTAssertTrue(viewModel.segments.isEmpty, "Invalid started not empty")
        let segmentID = "Test1"
        let segment1ID = "Test2"
        let segmentConfigurations = ITSegment(title: segmentID)
        let segmentConfigurations1 = ITSegment(title: segment1ID)
        viewModel.add(segment: segmentConfigurations)
        viewModel.add(segment: segmentConfigurations1)
        XCTAssertEqual(viewModel.segments.count, 2, "Segments not added to model")
    }
    
    func testRemoveSegmentwithTitle() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "Test"
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        viewModel.removeSegment(withTitle: segmentID)
        XCTAssertTrue(viewModel.segments.isEmpty, "Segment not removed from model")
    }
    
    func testRemoveAllSegments() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "Test1"
        let segment1ID = "Test2"
        let segmentConfigurations = ITSegment(title: segmentID)
        let segmentConfigurations1 = ITSegment(title: segment1ID)
        viewModel.add(segment: segmentConfigurations)
        viewModel.add(segment: segmentConfigurations1)
        XCTAssertEqual(viewModel.segments.count, 2, "Segment not added to model")
        viewModel.removeAllSegments()
        XCTAssertTrue(viewModel.segments.isEmpty, "Segment not removed from model")
    }
    
    func testRemoveSelectedSegmentShouldSelectFirstSegment() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "Test1"
        let segmentID1 = "Test2"
        viewModel.add(segment: ITSegment(title: segmentID))
        viewModel.add(segment: ITSegment(title: segmentID1))
        viewModel.selectSegment(withTitle: segmentID)
        viewModel.removeSegment(withTitle: segmentID)
        
        XCTAssertEqual(viewModel.selectedSegment?.title, segmentID1, "Selected segment removal should get back to first segment")
    }
    
    func testRemoveSelectedSegmentWhenOnlyOneSegmentLeftSelectionShouldBeNil() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "Test1"
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        viewModel.selectSegment(withTitle: segmentID)
        viewModel.removeSegment(withTitle: segmentID)
        
        XCTAssertNil(viewModel.selectedSegment, "Only element, selected segment removal, selection should be nil")
    }
    
    func testUpdateSegmentTitle() {
        let viewModel = ITSegmentedControlViewModel()
        let oldTitle = "Test1"
        let newTitle = "Test2"
        let segmentConfigurations = ITSegment(title: oldTitle)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].title, oldTitle, "Item title is incorrect")
        viewModel.updateSegment(withTitle: oldTitle, updatedSegment: ITSegment(title: newTitle))
        XCTAssertEqual(viewModel.segments[0].title, newTitle, "Title not updated")
    }
    
    func testUpdateSegmentImage() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldImage = UIImage(systemName: "list.bullet.rectangle.fill")
        let newImage = UIImage(systemName: "list.bullet.rectangle")
        let segmentConfigurations = ITSegment(title: segmentID, image: oldImage)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].image, oldImage, "Item image is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, image: newImage))
        XCTAssertEqual(viewModel.segments[0].image, newImage, "Image not updated")
    }
    
    func testUpdateSegmentSelectedImage() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldImage = UIImage(systemName: "list.bullet.rectangle.fill")
        let newImage = UIImage(systemName: "list.bullet.rectangle")
        let segmentConfigurations = ITSegment(title: segmentID, selectedImage: oldImage)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].selectedImage, oldImage, "Item selected image is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, selectedImage: newImage))
        XCTAssertEqual(viewModel.segments[0].selectedImage, newImage, "Selected image not updated")
    }
    
    func testUpdateSegmentSelectedIndicatorColor() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldColor: UIColor = .blue
        let newColor: UIColor = .black
        let segmentConfigurations = ITSegment(title: segmentID, selectedIndicatorColor: oldColor)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].selectedIndicatorColor, oldColor, "Item indicator color is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, selectedIndicatorColor: newColor))
        XCTAssertEqual(viewModel.segments[0].selectedIndicatorColor, newColor, "Indicator color not updated")
    }
    
    func testUpdateSegmentTitleColor() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldColor: UIColor = .blue
        let newColor: UIColor = .black
        let segmentConfigurations = ITSegment(title: segmentID, titleColor: oldColor)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].titleColor, oldColor, "Item title color is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, titleColor: newColor))
        XCTAssertEqual(viewModel.segments[0].titleColor, newColor, "Title color not updated")
    }
    
    func testUpdateSegmentSelectedTitleColor() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldColor: UIColor = .blue
        let newColor: UIColor = .black
        let segmentConfigurations = ITSegment(title: segmentID, selectedTitleColor: oldColor)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].selectedTitleColor, oldColor, "Selected title color is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, selectedTitleColor: newColor))
        XCTAssertEqual(viewModel.segments[0].selectedTitleColor, newColor, "Selected title color not updated")
    }
    
    func testUpdateSegmentBackgroundColor() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldColor: UIColor = .blue
        let newColor: UIColor = .black
        let segmentConfigurations = ITSegment(title: segmentID, backgroundColor: oldColor)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].backgroundColor, oldColor, "Item background color is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, backgroundColor: newColor))
        XCTAssertEqual(viewModel.segments[0].backgroundColor, newColor, "Background color not updated")
    }
    
    func testUpdateSegmentSelectedBackgroundColor() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let oldColor: UIColor = .blue
        let newColor: UIColor = .black
        let segmentConfigurations = ITSegment(title: segmentID, selectedBackgroundColor: oldColor)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].selectedBackgroundColor, oldColor, "Selected background color is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, selectedBackgroundColor: newColor))
        XCTAssertEqual(viewModel.segments[0].selectedBackgroundColor, newColor, "Selected background color not updated")
    }
    
    func testUpdateSegmentBorderConfigurations() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let oldBorderConfigurations: ITSegmentBorderConfigurations = .init(borderColor: .black, borderWidth: 1)
        let newBorderConfigurations: ITSegmentBorderConfigurations = .init(borderColor: .blue, borderWidth: 1)
        let segmentConfigurations = ITSegment(title: segmentID, borderConfigurations: oldBorderConfigurations)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].borderConfigurations?.borderColor, oldBorderConfigurations.borderColor, "Border configurations is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, borderConfigurations: newBorderConfigurations))
        XCTAssertEqual(viewModel.segments[0].borderConfigurations?.borderColor, newBorderConfigurations.borderColor, "Border configurations not updated")
    }
    
    func testUpdateSegmentSelectedBorderConfigurations() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let oldBorderConfigurations: ITSegmentBorderConfigurations = .init(borderColor: .black, selectedBorderColor: .yellow, borderWidth: 1)
        let newBorderConfigurations: ITSegmentBorderConfigurations = .init(borderColor: .blue, selectedBorderColor: .red, borderWidth: 1)
        let segmentConfigurations = ITSegment(title: segmentID, borderConfigurations: oldBorderConfigurations)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertFalse(viewModel.segments.isEmpty, "Segment not added to model")
        XCTAssertEqual(viewModel.segments[0].borderConfigurations?.selectedBorderColor, oldBorderConfigurations.selectedBorderColor, "Selected border configurations is incorrect")
        viewModel.updateSegment(withTitle: segmentID, updatedSegment: ITSegment(title: segmentID, borderConfigurations: newBorderConfigurations))
        XCTAssertEqual(viewModel.segments[0].borderConfigurations?.selectedBorderColor, newBorderConfigurations.selectedBorderColor, "Selected border configurations not updated")
    }
    
    func testSelectSegmentWithValidId() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        viewModel.selectSegment(withTitle: segmentID)
        XCTAssertEqual(viewModel.selectedSegment?.title, segmentID, "Selection is not valid")
    }
    
    func testSelectSegmentWithInvalidId() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        let wrongID = "Wrong"
        viewModel.selectSegment(withTitle: wrongID)
        XCTAssertNil(viewModel.selectedSegment?.title, "Selection is not valid")
    }
    
    func testSelectSegmentWithInvalidIdWhileSelectionIsNotEmpty() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        viewModel.selectSegment(withTitle: segmentID)
        
        let wrongID = "Wrong"
        viewModel.selectSegment(withTitle: wrongID)
        XCTAssertEqual(viewModel.selectedSegment?.title, segmentID, "Selection is not preserved")
    }
    
    func testSelectSegmentWithValidIndex() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        let selectedIndex = 0
        viewModel.selectSegment(at: selectedIndex)
        XCTAssertEqual(viewModel.selectedSegmentIndex, selectedIndex, "Selection index is not valid")
    }
    
    func testSelectSegmentWithInvalidIndex() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let wrongSelectedIndex = -1
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        
        viewModel.selectSegment(at: wrongSelectedIndex)
        XCTAssertNil(viewModel.selectedSegmentIndex, "Selection index is not valid")
    }
    
    func testSelectSegmentWithInvalidIndexWhileSelectionIsNotEmpty() {
        let viewModel = ITSegmentedControlViewModel()
        let segmentID = "1"
        
        let selectedIndex = 0
        let wrongSelectedIndex = -1
        let segmentConfigurations = ITSegment(title: segmentID)
        viewModel.add(segment: segmentConfigurations)
        XCTAssertNil(viewModel.selectedSegment, "Selection is not empty")
        viewModel.selectSegment(at: selectedIndex)

        viewModel.selectSegment(at: wrongSelectedIndex)
        XCTAssertEqual(viewModel.selectedSegmentIndex, selectedIndex, "Selection index is not preserved")
    }
}
