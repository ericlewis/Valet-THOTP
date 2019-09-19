// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Valet-THOTP",
    platforms: [.iOS(.v13), .tvOS(.v13), .macOS(.v10_15), .watchOS(.v6)],
    products: [
        .library(
            name: "Valet-THOTP",
            type: .static,
            targets: ["Valet-THOTP"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Square/Valet", from: "3.0.0"),
        .package(url: "https://github.com/ericlewis/THOTP", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Valet-THOTP",
            dependencies: ["Valet", "THOTP"]),
        .testTarget(
            name: "Valet-THOTPTests",
            dependencies: ["Valet-THOTP"]),
    ]
)
