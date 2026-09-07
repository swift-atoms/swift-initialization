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
        .library(name: "Initialization", targets: ["Initialization"]),
        .library(name: "Initialization Standard Library Integration", targets: ["Initialization Standard Library Integration"]),
        .library(name: "Initialization Foundation Library Integration", targets: ["Initialization Foundation Library Integration"]),
        .library(name: "Initialization Test Support", targets: ["Initialization Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Initialization",
            dependencies: [
            ],
            path: "Sources/Initialization"
        ),
        .target(
            name: "Initialization Standard Library Integration",
            dependencies: [
                .target(name: "Initialization"),
            ],
            path: "Sources/Initialization Standard Library Integration"
        ),
        .target(
            name: "Initialization Foundation Library Integration",
            dependencies: [
                .target(name: "Initialization"),
                .target(name: "Initialization Standard Library Integration"),
            ],
            path: "Sources/Initialization Foundation Library Integration"
        ),
        .target(
            name: "Initialization Test Support",
            dependencies: [
                .target(name: "Initialization"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Initialization Tests",
            dependencies: [
                .target(name: "Initialization"),
                .target(name: "Initialization Test Support"),
                .target(name: "Initialization Standard Library Integration"),
                .target(name: "Initialization Foundation Library Integration"),
            ],
            path: "Tests/Initialization Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
