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

    public class Socket {
        var handle : UnsafeMutableRawPointer?

        public init(context: Context, type : SocketType) throws {
            // Call void *zmq_socket (void *context, int type);
            let p :  UnsafeMutableRawPointer? = zmq_socket(context.handle, type.rawValue)
            guard p != nil else {
                throw ZMQError.invalidHandle
            }

            // Now we can assign socket handle safely
            handle = p!
        }

        deinit {
            try! close()
        }

        /**
            Create an outgoing connection on the current socket

            This uses the following C library function:
                int zmq_connect (void *socket, const char *endpoint);
         */
        public func connect(endpoint : String) throws {
            let result = zmq_connect(handle, endpoint)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
        }

        /**
            Closes the current socket

            This uses the following C library function:
                int zmq_close (void *socket);
         */
        public func close() throws {
            let result = zmq_close(handle)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
        }

        /**
            Accept incoming connections on the current socket

            This uses the following C library function:
                int zmq_bind (void *socket, const char *endpoint);
         */
        public func bind(endpoint: String) throws {
            let result = zmq_bind(handle, endpoint)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
        }

        /**
            Send a message part via the current socket

            This uses the following C library function:
                int zmq_send (void *socket, void *buf, size_t len, int flags);
         */
        public func send(string : String) throws {
            /*
            let result = zmq_send(handle, endpoint)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
            */
        }

        public func recv() -> String {
            //TODO receive message
            return ""
        }
    }

}
