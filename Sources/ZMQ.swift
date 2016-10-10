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

// For now
import LibZMQ

public struct ZMQ {

    /*
        ipc - the library supports the ipc:// protocol
        pgm - the library supports the pgm:// protocol
        tipc - the library supports the tipc:// protocol
        norm - the library supports the norm:// protocol
        curve - the library supports the CURVE security mechanism
        gssapi - the library supports the GSSAPI security mechanism
    */
    public enum Capability : String {
        case ipc
        case pgm
        case tipc
        case norm
        case curve
        case gssapi
    }

    /*
        Returns the version tuple as (.major, .minor, .patch)
    */
    public static var version : (major: Int, minor: Int, patch: Int) {
        var major: Int32 = 0
        var minor: Int32 = 0
        var patch: Int32 = 0
        zmq_version(&major, &minor, &patch)
        return ( Int(major), Int(minor), Int(patch) )
    }

    /*
        Returns the version string (e.g. "4.1.0")
    */
    public static var versionString : String {
        let version = self.version
        return "\(version.major).\(version.minor).\(version.patch)"
    }

    /*
        Returns whether the capability is enabled or not
    */
    public static func has(_ capability : Capability) -> Bool {
        return zmq_has(capability.rawValue) == 1
    }

    /*
        The proxy connects a frontend socket to a backend socket. Conceptually,
        data flows from frontend to backend. Depending on the socket types,
        replies may flow in the opposite direction. The direction is conceptual
        only; the proxy is fully symmetric and there is no technical difference
        between frontend and backend.

        If the capture socket is not nil, the proxy shall send all messages,
        received on both frontend and backend, to the capture socket. The
        capture socket should be a .publish, .dealer, .push, or .pair typed
        socket.

        This uses the C library function:
            int zmq_proxy(const void *frontend, const void *backend, const void
            *capture);
    */
    public static func proxy(
        frontend : ZMQ.Socket,
        backend  : ZMQ.Socket,
        capture  : ZMQ.Socket? = nil) throws
    {
        let result = zmq_proxy(frontend.handle, backend.handle, capture?.handle)
        if result == -1 {
            throw ZMQError.last
        }
    }

}
