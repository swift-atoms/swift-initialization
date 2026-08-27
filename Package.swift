// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-initialization",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(
            name: "Initialization",
            targets: ["Initialization"]
        ),

        .library(
            name: "Initialization Standard Library Integration",
            targets: ["Initialization Standard Library Integration"]
        ),

        .library(
            name: "Initialization Apple Foundation Integration",
            targets: ["Initialization Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [

        .target(
            name: "Initialization",
            dependencies: []
        ),

        .target(
            name: "Initialization Standard Library Integration",
            dependencies: [
                "Initialization"
            ]
        ),

        .target(
            name: "Initialization Apple Foundation Integration",
            dependencies: [
                "Initialization",
                "Initialization Standard Library Integration",
            ]
        ),

        .testTarget(
            name: "Initialization Tests",
            dependencies: [
                "Initialization"
            ]
        ),

        .testTarget(
            name: "Initialization Standard Library Integration Tests",
            dependencies: [
                "Initialization",
                "Initialization Standard Library Integration",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
