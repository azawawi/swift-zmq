
/*
  To build and run this project, please type:
    swift build && ./build/debug/ZMQ
*/


//import ZMQ

print("Hello world")
//print("ipc    is supported = \(ZMQ.has(.ipc))")
/*
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
*/
