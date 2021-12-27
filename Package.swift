// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GM+Toast",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GM+Toast",
            targets: ["GM+Toast"]),
    ],
    dependencies: [
         .package(url: "https://github.com/shaokui-gu/GM.git", branch: "main"),
         .package(url: "https://github.com/jdg/MBProgressHUD.git", from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GM+Toast",
            dependencies: [
                "GM",
                "MBProgressHUD"
            ],
            path: "Sources",
            resources: [
                .process("Toast.bundle"),
            ]
        ),
        .testTarget(
            name: "ToastTests",
            dependencies: ["GM+Toast"]
        ),
    ]
)
