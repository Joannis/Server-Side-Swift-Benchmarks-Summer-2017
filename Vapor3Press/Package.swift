// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporPress",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .revision("beta")),
        .package(url: "https://github.com/openkitten/meow.git", .revision("0.0.20170720")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "Meow"]),
        .target(name: "Run", dependencies: ["App"]),
    ]
)

