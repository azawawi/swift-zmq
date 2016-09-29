
// For now
import CZeroMQ

//import LibZMQ
//if #available(iOS 9, *) {
  //import LibZMQ4iOS
//} else {
  //import LibZMQ
//}


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
