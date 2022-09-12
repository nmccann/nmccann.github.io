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
      .package(name: "Publish", url: "https://github.com/schrismartin/publish.git", .branch("master")),
      .package(name: "CNAMEPublishPlugin", url: "https://github.com/SwiftyGuerrero/CNAMEPublishPlugin", from: "0.1.0"),
      .package(url: "https://github.com/tanabe1478/YoutubePublishPlugin.git", .exact("0.1.0"))
    ],
    targets: [
        .target(
            name: "Website",
            dependencies: ["Publish", "CNAMEPublishPlugin", "YoutubePublishPlugin"]
        )
    ]
)
