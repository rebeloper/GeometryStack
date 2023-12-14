// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeometryStack",
    platforms: [
        .iOS(.v16), .macOS(.v13), .macCatalyst(.v16), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GeometryStack",
            targets: ["GeometryStack"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GeometryStack"),
        .testTarget(
            name: "GeometryStackTests",
            dependencies: ["GeometryStack"]),
    ]
)
