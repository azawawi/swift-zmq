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

  class Context {
    var pointer : UnsafeMutableRawPointer?

    init() throws {
        let contextHandle = zmq_ctx_new()
        if contextHandle == nil {
            throw ZMQError.invalidHandle
        }

        pointer = contextHandle
    }

    deinit {
        try! term()
    }

    func term() throws {
        if pointer != nil {
            let result = zmq_ctx_term(pointer)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
        }
    }

    func socket(_ socketOption : SocketOption) throws -> ZMQ.Socket {
        return try ZMQ.Socket(context: self, socketOption: socketOption)
    }

  }

  static func context() throws -> Context {
      return try Context()
  }

}
