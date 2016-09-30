//
// Hello World server in Swift
//

import Foundation
import ZMQ

func hwserver() {
    // Create a socket to listen and talk to incoming clients
    let context   = Context()
    let responder = context.socket(.rep)
    responder.bind("tcp://*:5555")

    while true {
        responder.recv()
        print("Received Hello")
        sleep(1)
        responder.send("World")
    }
}
