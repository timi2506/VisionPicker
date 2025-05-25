// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "VisionPicker",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "VisionPicker",
            targets: ["VisionPicker"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VisionPicker",
            dependencies: [],
            path: "Sources/VisionPicker",
            resources: []
        )
    ]
)
