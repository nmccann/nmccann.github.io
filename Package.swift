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
      .package(name: "Publish", url: "https://github.com/schrismartin/publish.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "Website",
            dependencies: ["Publish"]
        )
    ]
)
