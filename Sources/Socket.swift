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

extension ZMQ {

    public class Socket {
        var handle : UnsafeMutableRawPointer?

        public init(context: Context, type : SocketType) throws {
            // Call void *zmq_socket (void *context, int type);
            let p :  UnsafeMutableRawPointer? = zmq_socket(context.handle, type.rawValue)
            guard p != nil else {
                throw ZMQError.last
            }

            // Now we can assign socket handle safely
            handle = p!
        }

        deinit {
            do {
                try close()
            } catch {
                print(error)
            }
        }

        /**
            Create an outgoing connection on the current socket

            This uses the following C library function:
                int zmq_connect (void *socket, const char *endpoint);
         */
        public func connect(_ endpoint : String) throws {
            let result = zmq_connect(handle, endpoint)
            if result == -1 {
                throw ZMQError.last
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
                throw ZMQError.last
            }
        }

        /**
            Accept incoming connections on the current socket

            This uses the following C library function:
                int zmq_bind (void *socket, const char *endpoint);
         */
        public func bind(_ endpoint: String) throws {
            let result = zmq_bind(handle, endpoint)
            if result == -1 {
                throw ZMQError.last
            }
        }

        /**
            Stop accepting connections on the current socket

            This uses the following C library function:
                int zmq_unbind (void *socket, const char *endpoint);
         */
        public func unbind(_ endpoint: String) throws {
            let result = zmq_unbind(handle, endpoint)
            if result == -1 {
                throw ZMQError.last
            }
        }

        /**
            Send a message part via the current socket

            This uses the following C library function:
                int zmq_send (void *socket, void *buf, size_t len, int flags);
         */
        public func send(string : String, flags : Int32 = 0) throws {
            //TODO flags should be send/recv option or something like that
            let result = zmq_send(handle, string, string.characters.count, flags)
            if result == -1 {
                throw ZMQError.last
            }
        }

        /**
            Receive a message part from the current socket

            This uses the following C library function:
                int zmq_recv (void *socket, void *buf, size_t len, int flags);
         */
        public func recv(bufferLength : Int = 256, flags : Int32 = 0) throws -> String? {
            //TODO flags should be send/recv option or something like that
            let bufferPointer = UnsafeMutablePointer<CChar>.allocate(capacity: bufferLength)
            let result = zmq_recv(handle, bufferPointer, bufferLength, flags)
            if result == -1 {
                throw ZMQError.last
            }

            return String(validatingUTF8: bufferPointer)
        }
    }

}
