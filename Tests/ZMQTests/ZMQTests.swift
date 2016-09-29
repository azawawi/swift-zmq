/*
MIT License

Copyright (c) 2016 Ahmad M. Zawawi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

@testable import ZMQ
import XCTest

class ZMQTests: XCTestCase {
    
    func testVersion() {
        let (major, minor, patch) = ZMQ.version
        XCTAssertTrue(major >= 3, "Major version is 4 or more")
        XCTAssertTrue(major >= 1, "Major version is 1 or more")
        print("Found ZMQ version is \(major).\(minor).\(patch)")
    }
    
    func testHas() {
        print("ipc    is supported = \(ZMQ.has(.ipc))")
        print("pgm    is supported = \(ZMQ.has(.pgm))")
        print("tipc   is supported = \(ZMQ.has(.tipc))")
        print("norm   is supported = \(ZMQ.has(.norm))")
        print("curve  is supported = \(ZMQ.has(.curve))")
        print("gssapi is supported = \(ZMQ.has(.gssapi))")

        let ipcSupported = ZMQ.has(.ipc)
        XCTAssertTrue(ipcSupported, "ipc:// protocol is supported")

        let curveSupported = ZMQ.has(.ipc)
        XCTAssertTrue(curveSupported, "Curve is supported")
    }
}
