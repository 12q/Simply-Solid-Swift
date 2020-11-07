//: [Previous](@previous)

import Foundation

class BaseString {
    let lhString: String
    let rhString: String

    init(lh: String, rh: String) {
        self.lhString = lh
        self.rhString = rh
    }
    
    func summarized() -> String {
        return String(lhString + rhString)
    }
}

class DerivedString: BaseString {
    override init(lh: String, rh: String) {
        super.init(lh: lh, rh: "no value suppose to be added")
    }
}

BaseString(lh: "AAA", rh: "BBB").summarized()
DerivedString(lh: "AAA", rh: "BBB").summarized()



//: [Next](@next)
