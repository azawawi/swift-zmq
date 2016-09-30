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
import CZeroMQ

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
