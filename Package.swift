import PackageDescription

let package = Package(
    name: "ZMQ",
    dependencies: [
        .Package(
            url          : "https://github.com/azawawi/swift-libzmq.git",
            majorVersion : 0,
            minor        : 1
        )
    ]
)
