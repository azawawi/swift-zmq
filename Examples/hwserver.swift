//
// Hello World server in Swift
//

import Foundation
import ZMQ

func hwserver() throws {
    // Create a socket to listen and talk to incoming clients
    let context   = try ZMQ.Context()
    let responder = try context.socket(type: .rep)
    try responder.bind(endpoint: "tcp://*:5555")

    while true {
        let _ = try responder.recv()
        print("Received Hello")
        sleep(1)
        try responder.send(string: "World")
    }
}
