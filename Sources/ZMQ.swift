
// For now
import CZeroMQ

//import LibZMQ
//if #available(iOS 9, *) {
  //import LibZMQ4iOS
//} else {
  //import LibZMQ
//}

// Sources/ZMQ.swift
class ZMQ {

    /*
        ipc - the library supports the ipc:// protocol
        pgm - the library supports the pgm:// protocol
        tipc - the library supports the tipc:// protocol
        norm - the library supports the norm:// protocol
        curve - the library supports the CURVE security mechanism
        gssapi - the library supports the GSSAPI security mechanism
    */
    enum Capability : String {
        case ipc
        case pgm
        case tipc
        case norm
        case curve
        case gssapi
    }

    // void zmq_version (int *major, int *minor, int *patch)
    static var version : (major: Int, minor: Int, patch: Int) {
        var major: Int32 = 0
        var minor: Int32 = 0
        var patch: Int32 = 0
        zmq_version(&major, &minor, &patch)
        return ( Int(major), Int(minor), Int(patch) )
    }

    // int zmq_has (const char *capability)
    static func has(_ capability : Capability) -> Bool {
        return zmq_has(capability.rawValue) == 1
    }
}
