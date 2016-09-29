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

/*
  To build and run this project, please type:
    swift build && ./build/debug/ZMQ
*/


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
