import PackageDescription

let package = Package(
    name: "ZMQExamples",
    dependencies: [
        .Package(url: "https://github.com/azawawi/swift-zmq.git", majorVersion: 0, minor: 1),
    ]
)
