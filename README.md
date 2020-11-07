# Simply Solid Swift

#### Just another variation of SOLID for Swift (in Progress... )

## Contents
* [Scheme](#scheme)
* [Principles](#principles)
  * [Single Responsibility Principle](#single-responsibility-principle)
  * [Open Close Principle](#open-close-principle)
  * [Liskov's Substitution Principle](#liskovs-substitution-principle)
  * [Interface Segregation Principle](#interface-segregation-principle)
  * [Dependency Inversion Principle](#dependency-inversion-principle)
  

### Scheme
|  |  |
| ----------------------- | ----------------------- |
| **Single Responsibility** | **Interface Segregation** |
| :small_orange_diamond: Only one reason to change<br> :small_orange_diamond: Only one responsibility | :small_orange_diamond: Client should not be forced to implement methods it does not use<br> :small_orange_diamond: Fat Interfaces should be decoupled by its responsibilities |
| **Open Close** |  **Liskov’s Substitution** |
| :small_orange_diamond: Close for modification <br> :small_orange_diamond: Open for extension  | :small_orange_diamond: Extended class should be substitutional with its Base class  <br> :small_orange_diamond: Modification should not affect Base behavier |
| **Dependency Inversion** | |
| :small_orange_diamond: Details depend on abstractions | :small_orange_diamond: Abstractions should not depend on details |
|  |  |


## Principles
### Single Responsibility Principle
:small_orange_diamond: Only one reason to change\
:small_orange_diamond: Only one responsibility
> Avoid _God_ classes





<!---->
<!--Example: :poop:-->
<!--```swift-->
<!--class Base {-->
<!--    func baseFunc() -> Data { ... }-->
<!--    func supportFunc(_ data: Data) -> Model { ... }-->
<!--    func otherStuffFunc() -> Something { ... }-->
<!--}-->
<!--```-->
<!--**Split 'Em All** :hurtrealbad:-->
<!--```swift-->
<!--class Base {-->
<!--    func baseFunc() -> Data { ... }-->
<!--}-->
<!---->
<!--class Support {-->
<!--    func supportFunc(_ data: Data) -> Model { ... }-->
<!--}-->
<!---->
<!--class OtherStuff {-->
<!--    func otherStuffFunc() -> Something { ... }-->
<!--}-->
<!--```-->
<!---->
<!--### Open Close Principle-->
<!--   :small_orange_diamond: Open for extension\-->
<!--   :small_orange_diamond: Closed for modifications-->
<!---->
<!--Example: :poop:-->
<!--```swift-->
<!--// MARK: - Base Class-->
<!--class Base {-->
<!--    let type: Type-->
<!--    var param: String-->
<!---->
<!--    init(type: Type, param: String) {-->
<!--        self.type = type-->
<!--        self.param = param-->
<!--    }-->
<!--}-->
<!---->
<!--// MARK: - Inherited Classes-->
<!--class Reverse: Base {-->
<!--    init(with param: String) {-->
<!--        super.init(type: .reversed, param: param)-->
<!--    }-->
<!--}-->
<!--class Lowercase: Base { ... }-->
<!--class Join: Base { ... }-->
<!---->
<!--// MARK: - Class that operates with the instances of type Base-->
<!--class Configurator {-->
<!--    func confugure(_ object: Base) {-->
<!--        var result: String-->
<!--        switch object.type {-->
<!--        case .reversed:-->
<!--            result = String(object.param.reversed())-->
<!--        case .lowercased:-->
<!--            result = object.param.lowercased()-->
<!--        case .joined:-->
<!--            result = object.param.replacingOccurrences(of: " ", with: "")-->
<!--        // Here will be more cases-->
<!--        // case .somethingNew-->
<!--        // and more-->
<!--        // case .somethingNewer-->
<!--        // and much more-->
<!--        // case .evenNewever-->
<!--        }-->
<!--    }-->
<!--}-->
<!---->
<!--// MARK: - Test-->
<!--Configurator().confugure(Reverse(with: "This text will be reversed"))-->
<!--Configurator().confugure(Lowercase(with: "GONNA BE LOWER"))-->
<!--Configurator().confugure(Join(with: "There Will Be No Spaces"))-->
<!--```-->
<!--Let's make our custom classes more responsible and let them implement (_extend_) the base functionality.-->
<!--```swift-->
<!--protocol Configurable {-->
<!--    func configure(param: String) -> String-->
<!--}-->
<!---->
<!--class Reverse: Configurable {-->
<!--    func configure(param: String) -> String {-->
<!--        return String(param.reversed())-->
<!--    }-->
<!--}-->
<!---->
<!--class Lowercase: Configurable {-->
<!--    func configure(param: String) -> String {-->
<!--        return param.lowercased()-->
<!--    }-->
<!--}-->
<!---->
<!--class Join: Configurable {-->
<!--    func configure(param: String) -> String {-->
<!--        return param.replacingOccurrences(of: " ", with: "")-->
<!--    }-->
<!--}-->
<!---->
<!--// MARK: - Class that operates with the instances that conforms Configurable protocal-->
<!--class Configurator {-->
<!--    func configure(object: Configurable, with param: String) {-->
<!--        let result = object.configure(param: param)-->
<!--    }-->
<!--}-->
<!---->
<!--// MARK: - Test-->
<!--Configurator().configure(object: Reverse(), with: "This text will be reversed")-->
<!--Configurator().configure(object: Lowercase(), with: "GONNA BE LOWER")-->
<!--Configurator().configure(object: Join(), with: "There Will Be No Spaces")-->
<!--```-->
<!--### Liskov's Substitution Principle-->
<!--   :small_orange_diamond: Keep the Basic Behavior\-->
<!--   :small_orange_diamond: Derived Classes should be Substitutional-->
<!---->
<!--Example: :poop:-->
<!--```swift-->
<!--class BaseString {-->
<!--    let lhString: String-->
<!--    let rhString: String-->
<!---->
<!--    init(lh: String, rh: String) {-->
<!--        self.lhString = lh-->
<!--        self.rhString = rh-->
<!--        }-->
<!---->
<!--    func summarized() -> String {-->
<!--        return String(lhString + " " + rhString)-->
<!--    }-->
<!--}-->
<!---->
<!--class DerivedString: BaseString {-->
<!--    override init(lh: String, rh: String) {-->
<!--        super.init(lh: lh, rh: "no value suppose to be here")-->
<!--    }-->
<!--}-->
<!---->
<!--BaseString(lh: "Don't", rh: "Panic").summarized()-->
<!--DerivedString(lh: "Don't", rh: "Panic").summarized()-->
<!--```-->
<!--Try not to change tha Base behavior, if your class derived from it :no_entry:-->
<!---->
<!--###  Interface Segregation Principle-->
<!--   :small_orange_diamond: Split into logical pieces\-->
<!--   :small_orange_diamond: Do not depend upon abstractions (Interfaces) that you don't use-->
<!---->
<!--Example: :poop:-->
<!--```swift-->
<!--protocol Controlable {-->
<!--    func play(item: Playable)-->
<!--    func stop(item: Playable)-->
<!--    func rwd(item: Playable)-->
<!--    func ff(item: Playable)-->
<!--    func next(item: Playable)-->
<!--    func previous(item: Playable)-->
<!---->
<!--    func likeIt(item: Playable)-->
<!--    func shareIt(item: Playable)-->
<!--}-->
<!--```-->
<!--Ain't no magic, right?-->
<!--```swift-->
<!--protocol Controlable {-->
<!--    func play(item: Playable)-->
<!--    func stop(item: Playable)-->
<!--    func rwd(item: Playable)-->
<!--    func ff(item: Playable)-->
<!--    func next(item: Playable)-->
<!--    func previous(item: Playable)-->
<!--}-->
<!---->
<!--protocol Sociable {-->
<!--    func likeIt(item: Playable)-->
<!--    func shareIt(item: Playable)-->
<!--}-->
<!--```-->
<!--nuff said-->
<!---->
<!---->
<!--###  Dependency Inversion Principle-->
<!--   :small_orange_diamond: Details should depend on abstractions\-->
<!--   :small_orange_diamond: Abstractions should not depend on details-->
<!--```swift-->
<!--protocol Managable {-->
<!--    func prepare()-->
<!--    func log()-->
<!--}-->
<!---->
<!--class Service: Managable {-->
<!--    func prepare() { print("preparing...")}-->
<!--    func log() { print("result") }-->
<!--}-->
<!---->
<!--class Controller {-->
<!--    let service: Managable-->
<!--    /// We set our Dependency from Outside-->
<!--    /// Our Class is only knows that Dependency comforms the Protocol-->
<!--/* ---------------------------- HERE ---------------------------- */-->
<!--    init(with service: Managable) {-->
<!--        self.service = service-->
<!--    }-->
<!--/* ---------------------------- **** ---------------------------- */-->
<!---->
<!--    public func manage() {-->
<!--        service.prepare()-->
<!--    }-->
<!---->
<!--    public func show() {-->
<!--        service.log()-->
<!--        }-->
<!--}-->
<!---->
<!--// MARK: - Example-->
<!--let controller = Controller(with: Service())-->
<!--controller.manage()-->
<!--controller.show()-->
<!--```-->











