//
// Hello World server in Swift
//

import ZMQ

// Create a socket to listen and talk to incoming clients
var context   = ZMQ.Context()
var responder = context.socket(.rep)
responder.bind("tcp://*:5555")

while true {
    responder.recv()
    print("Received Hello")
    sleep(1)
    responder.send("World")
}
