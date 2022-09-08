// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Website",
    products: [
        .executable(
            name: "Website",
            targets: ["Website"]
        )
    ],
    dependencies: [
      .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", .exact("0.8.0"))
    ],
    targets: [
        .target(
            name: "Website",
            dependencies: ["Publish"]
        )
    ]
)
