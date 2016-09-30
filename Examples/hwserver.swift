//
// Hello World server in Swift
//

import Foundation
import ZMQ

func hwserver() {
    // Create a socket to listen and talk to incoming clients
    let context   = ZMQ.context()
    let responder = context.socket(.rep)
    responder.bind("tcp://*:5555")

    while true {
        responder.recv()
        print("Received Hello")
        sleep(1)
        responder.send("World")
    }
}
