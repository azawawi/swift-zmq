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
        XCTAssertTrue(major >= 4, "Major version is 4 or more")
        XCTAssertTrue(minor >= 0, "minor is greater than or equal to zero")
        XCTAssertTrue(patch >= 0, "patch is greater than or equal to zero")

        let versionString = ZMQ.versionString
        XCTAssertTrue(versionString == "\(major).\(minor).\(patch)")
    }

    func testHas() {
        let _ = ZMQ.has(.ipc)
        XCTAssertTrue(true, ".ipc works")

        let _ = ZMQ.has(.pgm)
        XCTAssertTrue(true, ".pgm works")

        let _ = ZMQ.has(.tipc)
        XCTAssertTrue(true, ".tipc works")

        let _ = ZMQ.has(.norm)
        XCTAssertTrue(true, ".norm works")

        let _ = ZMQ.has(.curve)
        XCTAssertTrue(true, ".curve works")

        let _ = ZMQ.has(.gssapi)
        XCTAssertTrue(true, ".gssapi works")
    }

    func testContext() {
        do {
            let context = try ZMQ.Context()
            XCTAssertTrue(true, "Context created")

            // ioThreads property
            XCTAssertTrue( try context.getIOThreads() == 1, "Default value for ioThreads is 1" )
            let newIoThread = 2
            try context.setIOThreads(newIoThread)
            XCTAssertTrue( try context.getIOThreads() == newIoThread,
                "ioThreads property setter works" )

            // maxSockets and socketLimit property
            let socketLimit = try context.getSocketLimit()
            XCTAssertTrue( socketLimit > 0, "Default value for socketLimit > 0" )
            XCTAssertTrue( try context.getMaxSockets() <= socketLimit, "Default value for maxSockets <= socketLimit" )
            let newMaxSockets = 2
            try context.setMaxSockets(newMaxSockets)
            XCTAssertTrue( try context.getMaxSockets() == newMaxSockets,
                "maxSockets property setter works" )

            // ipv6Enabled property
            XCTAssertFalse( try context.isIPV6Enabled(),
                "Default value for IPV6Enabled is false" )
            let newIpv6Enabled = true
            try context.setIPV6Enabled(newIpv6Enabled)
            XCTAssertTrue( try context.isIPV6Enabled() == newIpv6Enabled,
                "IPV6Enabled property setter works" )

            // setThreadPriority
            try context.setThreadPriority(10)
            XCTAssertTrue(true, "Context setThreadPriority works")

            // setThreadSchedulingPolicy
            try context.setThreadSchedulingPolicy(5)
            XCTAssertTrue(true, "Context setThreadSchedulingPolicy works")

        } catch {
            XCTFail("Context creation failure")
        }
    }
}
