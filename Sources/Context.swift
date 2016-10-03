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

    public class Context {
        var handle : UnsafeMutableRawPointer?

        public init() throws {
            let contextHandle = zmq_ctx_new()
            if contextHandle == nil {
                throw ZMQError.invalidHandle
            }

            handle = contextHandle
        }

        deinit {
            try! term()
        }

        public func term() throws {
            guard handle != nil else {
                return
            }

            let result = zmq_ctx_term(handle)
            if result == -1 {
                throw ZMQError.invalidHandle
            } else {
                handle = nil
            }
        }

        public func socket(type : ZMQ.SocketType) throws -> Socket {
            return try Socket(context: self, type: type)
        }

        /*
            private generic function to get context value

            Uses the following C library function:
                int zmq_ctx_get (void *context, int option_name);
         */
        private func getOption(_ name : Int32) throws -> Int32 {
            let result = zmq_ctx_get(handle, name)
            if result == -1 {
                throw ZMQError.invalidHandle
            }

            return result
        }

        /*
            private generic function to set option value for the current context

            Uses the following C library function:
                int zmq_ctx_set (void *context, int option_name, int option_value);
         */
        private func setOption(_ name: Int32, _ value: Int32) throws {
            let result = zmq_ctx_set(handle, name, value)
            if result == -1 {
                throw ZMQError.invalidHandle
            }
        }

        /*
            Sets the number of I/O threads for the current context
         */
        public func getIOThreads() throws -> Int {
            return try Int(getOption(ZMQ_IO_THREADS))
        }

        /*
            Sets the number of I/O threads for the current context
         */
        public func setIOThreads(_ value : Int = 1) throws {
            try setOption(ZMQ_IO_THREADS, Int32(value))
        }

        /*
            Sets the scheduling policy for I/O threads for the current context
         */
        public func setThreadSchedulingPolicy(_ value : Int = -1) throws {
            try setOption(ZMQ_THREAD_SCHED_POLICY, Int32(value))
        }

        /*
            Sets the scheduling priority for I/O threads for the current context
         */
        public func setThreadPriority(_ value : Int = -1) throws {
            try setOption(ZMQ_THREAD_PRIORITY, Int32(value))
        }

        /*
            Gets the maximum number of sockets associated with the current
            context
         */
        public func getMaxSockets() throws -> Int {
            return try Int(getOption(ZMQ_MAX_SOCKETS))
        }

        /*
            Sets the maximum number of sockets associated with the current
            context
         */
        public func setMaxSockets(_ value : Int = 1024) throws {
            try setOption(ZMQ_MAX_SOCKETS, Int32(value))
        }

        /*
            Sets whether the IPV6 is enabled or not for the current context
         */
        public func setIPv6Enabled(_ enabled : Bool = false) throws {
            try setOption(ZMQ_IPV6, enabled ? 1 : 0)
        }

        /*
            Gets the maximum socket limit associated with the current
            context
         */
        public func getSocketLimit() throws -> Int {
            return try Int(getOption(ZMQ_SOCKET_LIMIT))
        }

        /*
            Gets whether the IPV6 is enabled or not for the current context
         */
        public func getIPv6Enabled() throws -> Bool {
            return try getOption(ZMQ_SOCKET_LIMIT) == 1
        }

    }

}
