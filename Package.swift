// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Website",
            targets: ["Website"]
        )
    ],
    dependencies: [
      .package(url: "https://github.com/JohnSundell/Publish", exact: "0.9.0"),
      .package(url: "https://github.com/SwiftyGuerrero/CNAMEPublishPlugin", branch: "master"),
      .package(url: "https://github.com/tanabe1478/YoutubePublishPlugin", exact: "1.0.1")
    ],
    targets: [
        .executableTarget(
            name: "Website",
            dependencies: ["Publish", "CNAMEPublishPlugin", "YoutubePublishPlugin"]
        )
    ]
)
