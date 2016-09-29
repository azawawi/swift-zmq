
// For now
import CZeroMQ

//import LibZMQ
//if #available(iOS 9, *) {
  //import LibZMQ4iOS
//} else {
  //import LibZMQ
//}

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
