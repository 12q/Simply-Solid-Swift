# Simply-Solid-Swift
Base SOLID principles in Swift
- [ ] Single Responsibility Principle
- [x] Open Close Principle
*  `open for extension`
*  `closed for modifications`

```swift
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
```

- [  ] Liskov's Substitution Principle
- [  ] Interface Segregation Principle
- [  ] Dependency Inversion Principle
