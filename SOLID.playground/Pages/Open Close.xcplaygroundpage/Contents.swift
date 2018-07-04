//: Playground - noun: a place where people can play



// 4. Single Responsibility Principle

// 2. OPEN CLOSE PRICIPLE
// * open for extension but closed for modifications *

protocol Shape {
    func area() -> Double
}

struct Rectangle: Shape {
    let width, height: Double
    func area() -> Double {
        return width * height
    }
}

struct Square: Shape {
    let side: Double
    func area() -> Double {
        return side * side
    }
}

struct Circle: Shape {
    let radius: Double
    func area() -> Double {
        return radius * radius * Double.pi
    }
}

class Calculator {
    let objects: [Shape]
    init(objects: [Shape]) {
        self.objects = objects
    }
    
    func calulcate() {
        for object in objects {
            object.area()
        }
    }
}

let calculator = Calculator(objects: [Circle(radius: 10),
                                      Square(side: 10),
                                      Rectangle(width: 20, height: 10)])
calculator.calulcate()

// 5. Liskov's Substitution Principle


// 3. Interface Segregation Principle






// 2. Dependency Inversion Principle
