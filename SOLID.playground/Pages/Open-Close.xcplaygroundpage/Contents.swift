//: Playground - noun: a place where people can play



// 4. Single Responsibility Principle

// 2. OPEN CLOSE PRICIPLE
// * open for extension but closed for modifications *

import Foundation

// Param
enum Type {
    case reversed, lowercased, joined
}

// MARK: - Base Class
class Base {
    let type: Type
    var param: String

    init(type: Type, param: String) {
        self.type = type
        self.param = param
    }
}

// MARK: - Inherited Classes
class Reverse: Base {
    init(with param: String) {
        super.init(type: .reversed, param: param)
    }
}

class Lowercase: Base {
    init(with param: String) {
        super.init(type: .lowercased, param: param)
    }
}

class Join: Base {
    init(with param: String) {
        super.init(type: .joined, param: param)
    }
}

// MARK: - Class that operates with instances of type Base
class Configurator {
    func confugure(_ object: Base) {
        var result: String
        switch object.type {
        case .reversed:
            result = String(object.param.reversed())
        case .lowercased:
            result = object.param.lowercased()
        case .joined:
            result = object.param.replacingOccurrences(of: " ", with: "")
            // Here will be more cases
            // case .somethingNew
            // and more
            // case .somethingNewer
            // and much more
            // case .evenNewever
        }
        print("result: \(result)")
    }
}

// MARK: - Test
Configurator().confugure(Reverse(with: "This text will be reversed"))
Configurator().confugure(Lowercase(with: "GONNA BE LOWER"))
Configurator().confugure(Join(with: "There Will Be No Spaces"))

//protocol Configurable {
//    func configure(param: String) -> String
//}
//
//class Reverse: Configurable {
//    func configure(param: String) -> String {
//        return String(param.reversed())
//    }
//}
//
//class Lowercase: Configurable {
//    func configure(param: String) -> String {
//        return param.lowercased()
//    }
//}
//
//class Join: Configurable {
//    func configure(param: String) -> String {
//        return param.replacingOccurrences(of: " ", with: "")
//    }
//}
//
//// MARK: - Class that operates with instances that conforms Configurable protocal
//class Configurator {
//    func configure(object: Configurable, with param: String) {
//        let result = object.configure(param: param)
//        print(result)
//    }
//}
//
//// MARK: - Test
//
//Configurator().configure(object: Reverse(), with: "This text will be reversed")
//Configurator().configure(object: Lowercase(), with: "GONNA BE LOWER")
//Configurator().configure(object: Join(), with: "There Will Be No Spaces")

