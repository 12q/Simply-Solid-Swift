//: [Previous](@previous)

import Foundation

protocol Managable {
    func prepare()
    func log()
}

class Service: Managable {
    func prepare() {}
    func log() {}
}

class Controller {
    let service: Managable
    init(_ service: Managable) {
        self.service = service
    }
    
    public func manage() {
        service.prepare()
    }
    
    public func show() {
        service.log()
    }
}

let service = Service()
let controller = Controller(service)
controller.manage()

//: [Next](@next)
