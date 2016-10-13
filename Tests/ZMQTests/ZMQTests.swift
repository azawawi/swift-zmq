/*
Copyright (c) 2016 Ahmad M. Zawawi (azawawi)

This package is distributed under the terms of the MIT license.
Please see the accompanying LICENSE file for the full text of the license.
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
            XCTAssertTrue(context.handle != nil, "socket.handle is not nil")

            // ioThreads
            XCTAssertTrue( try context.getIOThreads() == 1, "Default value for ioThreads is 1" )
            let newIoThread = 2
            try context.setIOThreads(newIoThread)
            XCTAssertTrue( try context.getIOThreads() == newIoThread,
                "ioThreads setter works" )

            // maxSockets and socketLimit
            let socketLimit = try context.getSocketLimit()
            XCTAssertTrue( socketLimit > 0, "Default value for socketLimit > 0" )
            XCTAssertTrue( try context.getMaxSockets() <= socketLimit, "Default value for maxSockets <= socketLimit" )
            let newMaxSockets = 2
            try context.setMaxSockets(newMaxSockets)
            XCTAssertTrue( try context.getMaxSockets() == newMaxSockets,
                "maxSockets setter works" )

            // ipv6Enabled
            XCTAssertFalse( try context.isIPV6Enabled(),
                "Default value for IPV6Enabled is false" )
            let newIpv6Enabled = true
            try context.setIPV6Enabled(newIpv6Enabled)
            XCTAssertTrue( try context.isIPV6Enabled() == newIpv6Enabled,
                "IPV6Enabled setter works" )

            // setThreadPriority
            try context.setThreadPriority(10)
            XCTAssertTrue(true, "Context setThreadPriority works")

            // setThreadSchedulingPolicy
            try context.setThreadSchedulingPolicy(5)
            XCTAssertTrue(true, "Context setThreadSchedulingPolicy works")

        } catch {
            XCTFail("Context tests failure")
        }
    }

    func testSocket() {
        do {
            // Test all socket types
            let socketTypes : [ZMQ.SocketType] = [.request, .reply, .router,
                .dealer, .publish, .subscribe, .xpublish, .xsubscribe, .push,
                .pull, .pair, .stream]
            for socketType in socketTypes {
                let context = try ZMQ.Context()
                let socket = try context.socket(socketType)
                XCTAssertTrue(socket.handle != nil, "socket.handle is not nil")
                XCTAssertTrue(true, "\(socketType) socket created")
            }

        } catch {
            XCTFail("Socket tests failure")
        }
    }
}
