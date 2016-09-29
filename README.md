# ZMQ

ZeroMQ Swift bindings

## Example

```swift
import ZMQ

let (major, minor, patch) = ZMQ.version
print("Found ZMQ version is \(major).\(minor).\(patch)")
```

## Usage

Add the following lines to your `Package.swift` to `ZMQ`

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
