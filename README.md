# Simply-Solid-Swift
Base SOLID principles in Swift



### Open Close Principle
* `_open for extension_`
* `_closed for modifications_`

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
