//
//  ITSegmentedControl.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

@IBDesignable
/// A custom scrollable segmented control with combinations of titles and images and selection styles.
final public class ITSegmentedControl: UIControl {
    
    struct UIConfig {
        static let defaultSegmentsSpacing: CGFloat = 0
        static let defaultSegmentsCornerRadius: CGFloat = 10
        static let margins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    // MARK: - Public Properties
    
    /// Use it to get current number of segments in segment controller
    public var numberOfSegments: Int {
        return viewModel.segments.count
    }
    
    /// Use it to get current selected segment index, could be nil if segment is empty
    public var selectedSegmentIndex: Int? {
        return viewModel.selectedSegmentIndex
    }
    
    /// Use it to get current selected segment, could be nil if segment is empty
    public var selectedSegment: ITSegment? {
        return viewModel.selectedSegment
    }
    
    /// Use it to get and set segments spacing
    @IBInspectable
    public var segmentsSpacing: CGFloat = UIConfig.defaultSegmentsSpacing {
        didSet {
            stackView.spacing = segmentsSpacing
        }
    }
    
    /// Use it to get and set segments corner radius
    @IBInspectable
    public var segmentsCornerRadius: CGFloat = UIConfig.defaultSegmentsCornerRadius {
        didSet {
            updateSegmentsCornerRadius()
        }
    }
    
    // MARK: - Private properties
    
    private let viewModel = ITSegmentedControlViewModel()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = segmentsSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        return scrollView
    }()
    
    // MARK: - LifeCycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewsHierarchy()
    }
    
    // MARK: - Public functions
    
    /// Use this method to add new segment with its configurations, ID should be unique
    /// - Parameters:
    ///   - segment: Configurations of this added segment, including title, title color, selected title color... etc
    public func add(segment: ITSegment) {
        viewModel.add(segment: segment)
        populateSegments()
    }
    
    /// Use it to update existing segment with new configuration
    /// - Parameters:
    ///   - id: Id of existing segment
    ///   - updatedConfigurations: Updated configuration of the segment
    public func updateSegment(withTitle title: String, updatedSegment: ITSegment) {
        viewModel.updateSegment(withTitle: title, updatedSegment: updatedSegment)
        populateSegments()
    }
    
    /// Use it to remove specific segment, if the segment is the selected segment, selection will get back to first segment, if segments are empty selection will turn to nil
    /// - Parameter id: Id of segment to be removed
    public func removeSegment(withTitle title: String) {
        viewModel.removeSegment(withTitle: title)
        populateSegments()
    }
    
    /// Use it to select segment at specific index
    /// - Parameter index: Index of the segment
    public func selectSegment(at index: Int) {
        viewModel.selectSegment(at: index)
        selectedSegmentDidUpdate()
    }
    
    /// Use it to select segment with specific id
    /// - Parameter id: Id of the segment
    public func selectSegment(withTitle title: String) {
        viewModel.selectSegment(withTitle: title)
        selectedSegmentDidUpdate()
    }
    
    // MARK: - Private functions
    
    private func setupViewsHierarchy() {
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIConfig.margins
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    private func populateSegments() {
        stackView.removeAllArrangedSubViews()
        for segment in viewModel.segments {
            let segmentViewModel = ITSegmentViewModel(segment: segment, isSelected: false)
            let segmentView = ITSegmentView(segmentViewModel: segmentViewModel)
            segmentView.onSelection = { [weak self] (segment) in
                self?.didSelect(segment: segment)
            }
            stackView.addArrangedSubview(segmentView)
        }
        updateSegmentsCornerRadius()
        selectedSegmentDidUpdate()
    }
    
    private func didSelect(segment: ITSegment) {
        viewModel.selectSegment(withTitle: segment.title)
        selectedSegmentDidUpdate()
        scrollToVisibleSegments()
        sendActions(for: .valueChanged)
    }
    
    private func selectedSegmentDidUpdate() {
        for segmentView in getSegmentViews() {
            segmentView.isSelected = viewModel.isSelected(segment: segmentView.segmentViewModel.segment)
        }
    }
    
    private func updateSegmentsCornerRadius() {
        for segmentView in getSegmentViews() {
            segmentView.layer.cornerRadius = segmentsCornerRadius
            segmentView.clipsToBounds = true
        }
    }
}

extension ITSegmentedControl {
    private func getSegmentViews() -> [ITSegmentView] {
        return stackView.arrangedSubviews.compactMap({ $0 as? ITSegmentView })
    }
}

extension ITSegmentedControl {
    private func scrollToVisibleSegments() {
        guard let selectedSegmentIndex else {
            return
        }
        let segmentWidth = scrollView.contentSize.width / CGFloat(numberOfSegments)
        let selectedSegmentOffset = segmentWidth * CGFloat(selectedSegmentIndex)
        
        let visibleSegments = floor(scrollView.frame.width / segmentWidth)
        let additionalSegments = (visibleSegments - 1) / 2  // Show (visibleSegments - 1) segments on each side
        
        var offsetX: CGFloat
        
        if self.semanticContentAttribute == .forceRightToLeft {
            // Right-to-left mode
            let maxVisibleX = selectedSegmentOffset + additionalSegments * segmentWidth
            offsetX = min(maxVisibleX, scrollView.contentSize.width - scrollView.frame.width)
        } else {
            // Left-to-right mode
            let minVisibleX = selectedSegmentOffset - additionalSegments * segmentWidth
            offsetX = max(0, min(minVisibleX, scrollView.contentSize.width - scrollView.frame.width))
        }
        
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}
