import PackageDescription

let package = Package(
    name: "ZMQ",
    dependencies: [
        .Package(url: "https://github.com/Zewo/CZeroMQ.git", majorVersion: 1)
    ]
)
