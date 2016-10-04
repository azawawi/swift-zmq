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

    public enum SocketType : Int32 {
        // Request-reply pattern
        case req
        case rep
        case router
        case dealer

        // Publish-subscribe pattern
        case pub
        case sub
        case xpub
        case xsub

        // Pipeline pattern
        case push
        case pull

        // Exclusive pair pattern
        case pair

        // Native pattern
        case stream
    }

}

extension ZMQ.SocketType {
    public var rawValue: Int32 {
        switch self {
            // Request-reply pattern
            case .req:    return ZMQ_REQ
            case .rep:    return ZMQ_REP
            case .router: return ZMQ_ROUTER
            case .dealer: return ZMQ_DEALER

            // Publish-subscribe pattern
            case .pub:    return ZMQ_PUB
            case .sub:    return ZMQ_SUB
            case .xpub:   return ZMQ_XPUB
            case .xsub:   return ZMQ_XSUB

            // Pipeline pattern
            case .push:   return ZMQ_PUSH
            case .pull:   return ZMQ_PULL

            // Exclusive pair pattern
            case .pair:   return ZMQ_PAIR

            // Native pattern
            case .stream: return ZMQ_STREAM
        }
    }
}
