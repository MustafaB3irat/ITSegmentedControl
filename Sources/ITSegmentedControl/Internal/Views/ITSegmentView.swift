//
//  ITSegmentView.swift
//  
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

final class ITSegmentView: UIView {
    
    struct UIConfig {
        static let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        static let selectedIndicatorHeight: CGFloat = 1
        static let defaultSegmentFont: UIFont = UIFont.preferredFont(forTextStyle: .body, compatibleWith: .current)
        static let backgroundColor: UIColor = .blue
        static let spacing: CGFloat = 5
        static let iconSize: CGSize = CGSize(width: 20, height: 20)
    }
    
    // MARK: - Public Properties
    
    var isSelected: Bool {
        didSet {
            if oldValue != isSelected {
                selectionStatusDidUpdate()
            }
        }
    }
    var onSelection: ((ITSegment) -> Void)?
    private(set) var segmentViewModel: ITSegmentViewModel
    
    // MARK: - Private Properties
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.defaultSegmentFont
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: UIConfig.iconSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: UIConfig.iconSize.height).isActive = true
        return imageView
    }()
    private lazy var stackView: UIStackView = {
        let arrangedSubViews = getContentStackViewArrangedSubViews()
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = .horizontal
        stackView.spacing = UIConfig.spacing
        return stackView
    }()
    private var selectedIndicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: UIConfig.selectedIndicatorHeight).isActive = true
        return view
    }()
    
    // MARK: - LifeCycle
    
    init(segmentViewModel: ITSegmentViewModel) {
        self.segmentViewModel = segmentViewModel
        self.isSelected = segmentViewModel.isSelected
        super.init(frame: .zero)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    // MARK: - Public functions
    
    func updateSegment(_ segmentViewModel: ITSegmentViewModel) {
        self.segmentViewModel = segmentViewModel
    }
    
    // MARK: - Private functions
    
    private func initView() {
        backgroundColor = UIConfig.backgroundColor
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIConfig.edgeInsets
        setupViewTapGesture()
        setupViewHierarchy()
        populateData()
    }
    
    private func populateData() {
        setupContentStackViewArrangedSubviews()
        titleLabel.text = segmentViewModel.title
        titleLabel.textColor = segmentViewModel.titleColor
        titleLabel.sizeToFit()
        imageView.image = segmentViewModel.image
        imageView.isHidden = !segmentViewModel.shouldShowImageView
        imageView.tintColor = segmentViewModel.titleColor
        selectedIndicatorView.backgroundColor = segmentViewModel.selectedIndicatorColor
        backgroundColor = segmentViewModel.backgroundColor
        updateBorderConfigurations()
        updateSelectionIndicatorView()
    }
    
    private func updateBorderConfigurations() {
        layer.borderColor = segmentViewModel.borderColor.cgColor
        layer.borderWidth = segmentViewModel.borderWidth
    }
    
    private func setupViewHierarchy() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
    
    private func selectionStatusDidUpdate() {
        segmentViewModel.updateSelection(isSelected)
        populateData()
    }
    
    private func updateSelectionIndicatorView() {
        guard segmentViewModel.shouldShowSelectionIndicator else {
            selectedIndicatorView.removeFromSuperview()
            return
        }
        addSubview(selectedIndicatorView)
        NSLayoutConstraint.activate([
            selectedIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectedIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectedIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupViewTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(segmentDidClick(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func setupContentStackViewArrangedSubviews() {
        stackView.removeAllArrangedSubViews()
        for view in getContentStackViewArrangedSubViews() {
            stackView.addArrangedSubview(view)
        }
    }
    
    private func getContentStackViewArrangedSubViews() -> [UIView] {
        let subviews = segmentViewModel.contentType == .imageFirst ? [imageView, titleLabel] : [titleLabel, imageView]
        return subviews
    }
    
    @objc
    private func segmentDidClick(_ sender: UIView) {
        guard !isSelected else {
            return
        }
        isSelected.toggle()
        onSelection?(segmentViewModel.segment)
    }
}
