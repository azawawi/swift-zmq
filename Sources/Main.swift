
/*
  To build and run this project, please type:
    swift build && ./build/debug/ZMQ
*/

import CZeroMQ
//import LibZMQ
if #available(iOS 9, *) {
  //import LibZMQ4iOS
} else {
  //import LibZMQ
}
//import ZMQ

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

// Sources/Socket.swift
extension ZMQ {

  enum SocketOption : Int32 {
    case req
  }

  class Socket {
    var pointer : UnsafeMutableRawPointer?

    init(context: ZMQ.Context, socketOption : SocketOption) throws {
        // void *zmq_socket (void *context, int type);
        let p :  UnsafeMutableRawPointer? = zmq_socket(context.pointer, socketOption.rawValue)
        guard p != nil else {
            // TODO throw error
            return
        }

        // Now we can assign socket pointer safely
        pointer = p!
    }

    deinit {
      //TODO destroy socket
    }

    func connect(_ endpoint : String) {
        //int zmq_connect (void *socket, const char *endpoint);
        //let r = zmq_connect(endpoint)
    }

    func send(_ string : String) {
    }

    func recv() -> String {
      return ""
    }
  }
}

// Sources/Context.swift
extension ZMQ {

  class Context {
    var pointer : UnsafeMutablePointer<Int32>? = nil

    init() {
        //TODO zmq_context_new
    }

    deinit {
    }

    func socket(_ socketOption : SocketOption) throws -> ZMQ.Socket {
        return try ZMQ.Socket(context: self, socketOption: socketOption)
    }

  }

}

print("ipc    is supported = \(ZMQ.has(.ipc))")
print("pgm    is supported = \(ZMQ.has(.pgm))")
print("tipc   is supported = \(ZMQ.has(.tipc))")
print("norm   is supported = \(ZMQ.has(.norm))")
print("curve  is supported = \(ZMQ.has(.curve))")
print("gssapi is supported = \(ZMQ.has(.gssapi))")

let (major, minor, patch) = ZMQ.version
print("Found ZMQ version is \(major).\(minor).\(patch)")

print("Connecting to hello world server...")
let context   = ZMQ.Context()
let requestor = try context.socket(.req)
requestor.connect("tcp://localhost:5555")

for request_nbr in 1...5 {
  print("Sending Hello \(request_nbr)...")
  requestor.send("Hello")
  let _ = requestor.recv()
  print("Received World \(request_nbr)")
}
