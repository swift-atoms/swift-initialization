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
            name: "Initialization Primitive",
            targets: ["Initialization Primitive"]
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
            name: "Initialization",
            targets: ["Initialization"]
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
            name: "Initialization Primitive",
            dependencies: []
        ),

        .target(
            name: "Initialization Protocol",
            dependencies: [
                "Initialization Primitive"
            ]
        ),

        .target(
            name: "Initialization Witness",
            dependencies: [
                "Initialization Protocol"
            ]
        ),

        .target(
            name: "Initiable",
            dependencies: [
                "Initialization Witness"
            ]
        ),

        .target(
            name: "Initialization",
            dependencies: [
                "Initialization Primitive",
                "Initialization Protocol",
                "Initialization Witness",
                "Initiable",
            ]
        ),

        .target(
            name: "Initialization Standard Library Integration",
            dependencies: [
                "Initiable"
            ]
        ),

        .target(
            name: "Initialization Test Support",
            dependencies: [
                "Initialization"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Initialization Tests",
            dependencies: [
                "Initialization",
                "Initialization Standard Library Integration",
                "Initialization Test Support",
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
