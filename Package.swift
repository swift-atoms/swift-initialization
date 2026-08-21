// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-initialization-primitives",
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
            name: "Initialization Witness Primitives",
            targets: ["Initialization Witness Primitives"]
        ),

        .library(
            name: "Initiable",
            targets: ["Initiable"]
        ),

        .library(
            name: "Initialization Primitives",
            targets: ["Initialization Primitives"]
        ),

        .library(
            name: "Initialization Primitives Standard Library Integration",
            targets: ["Initialization Primitives Standard Library Integration"]
        ),

        .library(
            name: "Initialization Primitives Test Support",
            targets: ["Initialization Primitives Test Support"]
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
            name: "Initialization Witness Primitives",
            dependencies: [
                "Initialization Protocol"
            ]
        ),

        .target(
            name: "Initiable",
            dependencies: [
                "Initialization Witness Primitives"
            ]
        ),

        .target(
            name: "Initialization Primitives",
            dependencies: [
                "Initialization Primitive",
                "Initialization Protocol",
                "Initialization Witness Primitives",
                "Initiable",
            ]
        ),

        .target(
            name: "Initialization Primitives Standard Library Integration",
            dependencies: [
                "Initiable"
            ]
        ),

        .target(
            name: "Initialization Primitives Test Support",
            dependencies: [
                "Initialization Primitives"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Initialization Primitives Tests",
            dependencies: [
                "Initialization Primitives",
                "Initialization Primitives Standard Library Integration",
                "Initialization Primitives Test Support",
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
