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
            name: "Initialization Protocol",
            targets: ["Initialization Protocol"]
        ),

        .library(
            name: "Initialization Witness",
            targets: ["Initialization Witness"]
        ),

        .library(
            name: "Initiable",
            targets: ["Initiable"]
        ),

        .library(
            name: "Initialization Standard Library Integration",
            targets: ["Initialization Standard Library Integration"]
        ),

        .library(
            name: "Initialization Test Support",
            targets: ["Initialization Test Support"]
        ),
    ],
    dependencies: [],
    targets: [

        .target(
            name: "Initialization",
            dependencies: []
        ),

        .target(
            name: "Initialization Protocol",
            dependencies: [
                .target(name: "Initialization")
            ]
        ),

        .target(
            name: "Initialization Witness",
            dependencies: [
                .target(name: "Initialization Protocol")
            ]
        ),

        .target(
            name: "Initiable",
            dependencies: [
                .target(name: "Initialization Witness")
            ]
        ),

        .target(
            name: "Initialization Standard Library Integration",
            dependencies: [
                .target(name: "Initiable")
            ]
        ),

        .target(
            name: "Initialization Test Support",
            dependencies: [
                .target(name: "Initiable")
            ],
            path: "Tests/Initialization Test Support"
        ),

        .testTarget(
            name: "Initialization Tests",
            dependencies: [
                .target(name: "Initialization"),
            ]
        ),
        .testTarget(
            name: "Initialization Protocol Tests",
            dependencies: [
                .target(name: "Initialization Protocol"),
            ]
        ),
        .testTarget(
            name: "Initialization Witness Tests",
            dependencies: [
                .target(name: "Initialization Witness"),
                .target(name: "Initialization Test Support"),
            ]
        ),
        .testTarget(
            name: "Initiable Tests",
            dependencies: [
                .target(name: "Initiable"),
                .target(name: "Initialization Test Support"),
            ]
        ),
        .testTarget(
            name: "Initialization Standard Library Integration Tests",
            dependencies: [
                .target(name: "Initialization Standard Library Integration"),
                .target(name: "Initialization Test Support"),
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
