// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ClinicalSpecialtyNavigator",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "ClinicalSpecialtyNavigator", targets: ["ClinicalSpecialtyNavigator"])
    ],
    targets: [
        .executableTarget(
            name: "ClinicalSpecialtyNavigator",
            path: "Sources/ClinicalSpecialtyNavigator"
        ),
        .testTarget(
            name: "ClinicalSpecialtyNavigatorTests",
            dependencies: ["ClinicalSpecialtyNavigator"],
            path: "Tests/ClinicalSpecialtyNavigatorTests"
        )
    ]
)
