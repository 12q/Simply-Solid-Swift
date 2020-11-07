//: [Previous](@previous)

// MARK: - Single Responsibility Principle
/* A class should have only one reason to change. Robert C. Martin */

import Foundation

public struct Model: Codable {
    public var id: String
    public var name: String
    public var size: Int
}

///
/* ------------------------------- One way -------------------------------  */
///

class BaseClass {
    func baseFunc() -> Data {
        let json = """
                {
                    "id": "z04534",
                    "name": "The name is Loooong",
                    "size": 94,
                }
            """.data(using: .utf8)!
        return json
    }
    
    func otherFunc(_ data: Data) -> Model{
                let decoder = JSONDecoder()
                let model = try! decoder.decode(Model.self, from: data)
        return model
    }
}

let data = BaseClass().baseFunc()
let model = BaseClass().otherFunc(data)
print("data: \(data)\nmodel: \(model)")

///
/* ------------------------------- SR way -------------------------------  */
///

//class BaseClass {
//    func baseFunc() -> Data {
//        let json = """
//            {
//                "id": "z04534",
//                "name": "The name is Loooong",
//                "size": 94,
//            }
//            """.data(using: .utf8)!
//        return json
//    }
//}
//
//class OtherClass {
//    func otherFunc(_ data: Data) -> Model {
//        let decoder = JSONDecoder()
//        let model = try! decoder.decode(Model.self, from: data)
//        return model
//    }
//}
//
//let data = BaseClass().baseFunc()
//let model = OtherClass().otherFunc(data)
//print("data: \(data)\nmodel: \(model)")

//: [Next](@next)
