//
//  ITSegmentedControlViewModel.swift
//
//
//  Created by Mustafa Bi’rat on 08/01/2024.
//

import UIKit

final class ITSegmentedControlViewModel {
    
    // MARK: - Public Properties
    
    private(set) var segments: [ITSegment] = .init()
    private(set) var selectedSegment: ITSegment?
    var selectedSegmentIndex: Int {
        return segments.firstIndex(where: { $0.title == selectedSegment?.title })!
    }
    
    // MARK: - LifeCycle
    
    init() {}
    
    // MARK: - Public functions
    
    func add(segment: ITSegment) {
        segments.append(segment)
    }
    
    func removeSegment(withTitle title: String) {
        segments.removeAll(where: { $0.title == title })
        if selectedSegment?.title == title {
            selectedSegment = segments.first
        }
    }
    
    func removeAllSegments() {
        segments.removeAll()
    }
    
    func updateSegment(withTitle title: String, updatedSegment: ITSegment) {
        guard let index = segments.firstIndex(where: { $0.title == title }) else {
            return
        }
        segments[index] = updatedSegment
    }
    
    func selectSegment(at index: Int) {
        guard index >= 0,
              index < segments.count else {
            return
        }
        selectedSegment = segments[index]
    }
    
    func selectSegment(withTitle title: String) {
        guard let segment = segments.first(where: { $0.title == title }) else {
            return
        }
        selectedSegment = segment
    }
    
    func isSelected(segment: ITSegment) -> Bool {
        return selectedSegment?.title == segment.title
    }
}
