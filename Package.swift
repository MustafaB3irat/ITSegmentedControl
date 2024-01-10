// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "ITSegmentedControl",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ITSegmentedControl",
            targets: ["ITSegmentedControl"]),
    ],
    targets: [
        .target(
            name: "ITSegmentedControl"),
        .testTarget(
            name: "ITSegmentedControlTests",
            dependencies: ["ITSegmentedControl"]),
    ]
)
