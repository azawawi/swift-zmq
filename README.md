# ZMQ

This package provides [swift](http://swift.org) API bindings for the famous
[ZeroMQ](http://zeromq.org).

**Note: At the moment, please consider the project experimental.**

> ZeroMQ (also spelled ØMQ, 0MQ or ZMQ) is a high-performance asynchronous
> messaging library, aimed at use in distributed or concurrent applications. It
> provides a message queue, but unlike message-oriented middleware, a ZeroMQ
> system can run without a dedicated message broker. The library's API is
> designed to resemble that of Berkeley sockets.
>
> ZeroMQ is developed by a large community of contributors, founded by iMatix,
> which holds the domain name and trademarks. There are third-party bindings for
> many popular programming languages.

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

## Usage

Your `Package.swift` should be something like the following code to be able to
use this package:

```swift
import PackageDescription

let package = Package(
    name: "YourModuleName",
    dependencies: [
        .Package(url: "https://github.com/azawawi/swift-zmq.git", majorVersion: 0, minor: 1),
    ]
)
```

## Testing

To run tests, please type:
```
$ swift test
```

## See Also

- [Zewo's ZeroMQ swift bindings](https://github.com/ZewoGraveyard/ZeroMQ)

## Author

Ahmad M. Zawawi, https://github.com/azawawi/

## License

MIT License
