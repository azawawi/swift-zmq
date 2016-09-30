//
// Hello World server in Swift
//

import Foundation
import ZMQ

func hwserver() throws {
    // Create a socket to listen and talk to incoming clients
    let context   = try Context()
    let responder = try context.socket(.rep)
    responder.bind("tcp://*:5555")

    while true {
        let _ = responder.recv()
        print("Received Hello")
        sleep(1)
        responder.send("World")
    }
}
