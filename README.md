# ZMQ - ZeroMQ Swift bindings

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![License][mit-badge]][mit-url]

This package provides [Swift](http://swift.org) API bindings for the famous
[ZeroMQ](http://zeromq.org) library.

**Note: At the moment, please consider the project experimental.**

> ZeroMQ (also spelled ØMQ, 0MQ or ZMQ) is a high-performance asynchronous
> messaging library, aimed at use in distributed or concurrent applications. It
> provides a message queue, but unlike message-oriented middleware, a ZeroMQ
> system can run without a dedicated message broker. The library's API is
> designed to resemble that of Berkeley sockets.

## Project Goals

- Provide an easy to use API to ZeroMQ using Swift language idioms
- Provide up to date ZeroMQ binaries for iOS and the macOS plaforms
- Support linux and macOS plaforms for server-side projects
- Support iOS platform for mobile app projects

## Example

```swift
import ZMQ

let (major, minor, patch) = ZMQ.version
print("ZeroMQ library version is \(major).\(minor).\(patch)")
```

More examples can be found in the
[examples](https://github.com/azawawi/swift-zmq-examples) github repository.

## Usage

Your `Package.swift` should be something like the following code to be able to
use this package:

```swift
import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
        .Package(
            url          : "https://github.com/azawawi/swift-zmq.git",
            majorVersion : 0,
            minor        : 4
        )
    ]
)
```

## Installation

Please check [LibZMQ](https://github.com/azawawi/swift-libzmq) for installation
instructions.

## Testing

To run tests, please type:
```
$ swift test
```

## Troubleshooting

- You may get the following error after a `swift build`:

    ```
error: The dependency graph could not be satisfied because an update to...
```

    To resolve it, please run:

    ```
swift build --clean dist
swift build
```

## See Also

- [Zewo's ZeroMQ swift bindings](https://github.com/ZewoGraveyard/ZeroMQ)

## Author

[Ahmad M. Zawawi](https://github.com/azawawi)

## License

MIT License

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
