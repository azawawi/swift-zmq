
// Hello World client in Swift

import Foundation
import ZMQ

func hwclient() {
    print("Connecting to hello world server...")
    var context   = ZMQ.context()
    var requestor = context.socket(.req)
    requestor.connect("tcp://localhost:5555")

    for request_nbr in 0...9 {
        print("Sending Hello \(request_nbr)...")
        requestor.send("Hello")
        requestor.recv()
        print("Received World \(request_nbr)")
    }
}
