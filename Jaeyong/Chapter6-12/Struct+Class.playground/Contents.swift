// 구조체 정의하기 : UpperCamelCase
struct BasicInformation {
    var name: String
    var age: Int
}
// 구조체 인스턴스 생성 및 초기화
var wodyInfo: BasicInformation = BasicInformation(name: "Jaeyong", age: 23)
wodyInfo.age = 22
// 클래스 선언하기 : UpperCamelCase
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}
// 클래스 인스턴스 생성 및 초기화
var jaeyong: Person = Person()
jaeyong.height = 177.1 // let으로 선언해도 클래스는 참조타입이므로 변경 가능하다.
jaeyong.weight = 70.1
var testPerson: Person? = Person()
testPerson = nil

// 구조체와 클래스의 같은점
// 1. 값을 저장하기 위해 프로퍼티를 정의할 수 있습니다.
// 2. 기능 실행을 위해 메서드를 정의할 수 있습니다.
// 3. 초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있습니다.
// 4. 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있습니다. 또한 특정 프로토콜을 준수할 수 있습니다.
// 구조체와 클래스의 다른점
// 1. 구조체는 상속할 수 없습니다.
// 2. 타입캐스팅은 클래스의 인스턴스에만 허용됩니다.
// 3. 디이니셜라이저는 클래스의 인스턴스에만 활용할 수 있습니다.
// 4. 참조 횟수 계산은 클래스의 인스턴스에만 적용됩니다.

// 구조체의 인스턴스는 값 타입이고, 클래스의 인스턴스는 참조 타입이라는 것이 둘을 구분하는 가장 큰 차이점입니다.
// 값과 참조의 차이는 '무엇이 전달되느냐'입니다. 어떤 함수의 전달인자로 값 타입의 값을 넘긴다면 전달된 값이 복사되어 전달됩니다. 그러나 참조타입이 전달인자로 전달된 때는 값을 복사하지 않고 참조(주소)가 전달됩니다. 함수의 전달인자로 넘길 때도 참조가 전달되며 다른 변수 또는 상수에 할당할 때도 마찬가지로 참조가 할당됩니다. 아래는 이에 대한 예시이다.

// 값을 복사하여 할당해준다.
var friendInfo: BasicInformation = wodyInfo
print(wodyInfo.age)
print(friendInfo.age)
friendInfo.age = 100
print(wodyInfo.age)
print(friendInfo.age)
// jaeyong의 참조를 할당해준다.
var friend: Person = jaeyong
print("jaeyong's height: \(jaeyong.height)")
print("friend's height: \(friend.height)")
friend.height = 180.2
print("jaeyong's height: \(jaeyong.height)")
print("friend's height: \(friend.height)")
func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person) {
    info.height = 169.9
}
// changeBasicInfo로 전달되는 전달인자는 값이 복사되어 전달되기 때문에 wodyInfo의 값만 전달됩니다.
changeBasicInfo(wodyInfo)
print(wodyInfo.age)
// changePersonInfo로 전달되는 전달인자는 참조로 전달되기 때문에 실제 jaeyong이 참조하는 값들에 변화가 생깁니다.
changePersonInfo(jaeyong)
print(jaeyong.height)

// 식별 연산자 : 같은 인스턴스를 사용하고 있는지 아닌지를 판단해줍니다.
var person: Person = Person()
var me: Person = person
var anotherPerson: Person = Person()
print(person === me)
print(anotherPerson === me)
print(anotherPerson !== person)

// 스위프트의 기본 데이터 타입은 모두 구조체입니다.
//public struct String {
//    public init()
//}


// Property
// 저장 프로퍼티
// struct내의 저장 프로퍼티는 var와 let으로 선언할 수 있다.
// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다. 클래스는 프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다!
// 굳이 초기값이 필요가 없는 경우엔 옵셔널로 선언해도 된다.
// 지연 저장 프로퍼티: lazy
struct CoordinatePoint{
    var x: Int = 0
    var y: Int = 0
    
    var oppositePoint: CoordinatePoint {
        // 점근자
        // get만 선언하면 읽기전용으로 선언할 수 있다.
        get {
            // return 키워드는 생략 가능하다.
            return CoordinatePoint(x: -x, y: -y)
        }
        // 설정자
        set(opposite) {
            // opposite 매개변수를 설정안하고 newValue라는 매개변수 이름으로 대신할 수 있다.
            x = -opposite.x
            y = -opposite.y
        }
    }
}

class Position {
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    init(name: String) {
        self.name = name
    }
}
let wodyPosition: Position = Position(name: "wody")
print(wodyPosition.point)
// 위 print코드를 통해 point 프로퍼티의 Coordinate가 생성된다.
// 연산 프로퍼티
extension CoordinatePoint{
    // 대칭점을 구하는 메서드
    func oppositePointFunction() -> Self {
        return CoordinatePoint(x: -x, y: -y)
    }
    // 대칭점을 설정하는 메서드
    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }
}
// 위 두 메서드를 프로퍼티로 바꾸면 간편하게 사용할 수 있다.
// 프로퍼티 감시자
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}
let myAccount: Account = Account()
myAccount.credit = 1000
// 타입 프로퍼티!!
class AClass {
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0 {
        didSet {
            Self.typeProperty = instanceProperty + 100
            // 여기서 Self는 자기 자신을 의미한다! static으로 타입프로퍼티로 선언되었다면 self가 아닌 Self키워드를 사용해주어야 한다.
        }
    }
}
// 프로퍼티의 키경로
// 함수를 참조로 선언해두고 나중에 원할때 호출할 수 있듯이 프로퍼티도 값을 바로 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 할 수 있다. 이것이 키 경로를 활용하는 방법이다.
class PersonA {
    var name: String
    init(name: String) {
        self.name = name
    }
}
struct Stuff {
    var name: String
    var owner: PersonA
}

print(type(of: \PersonA.name))
print(type(of: \Stuff.name))

// 구조체의 특권!: 멤버와이즈 이니셜라이저
// 구조체는 클래스와 달리 이니셜라이저를 선언해주지 않는다면 제공해주는 이니셜라이저가 있다. 그것이 멤버와이즈 이니셜라이저.
struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let size: Size = Size(width: 50.0, height: 50.0)
let sizeA: Size = Size(width: 50.0)
let sizeB: Size = Size()
let sizeC: Size = Size(height: 60.0)

// 함수를 사용한 프로퍼티 기본값 설정

struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {
        var arr: [Student] = [Student]()
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)

// 인스턴스 소멸
class SomeClass {
    deinit {}
}

// 접근수준
// 개방 접근수준 - open
// 개방은 가장 높은 접근수준으로, 정말 어디서든 접근이 가능하다.
//open class NSString : NSObject, NSCoptying... {
//    open var length: Int { get }
//    open func character(at index: Int) -> CUnsignedChar
//    public init()
//}
// 공개 접근수준 - public
// 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰인다.
public struct Bool {
//    public init
}
// 내부 접근수준 - internal
// 기본적으로 모든 욧에 암묵적으로 지정하는 기본 접근수준이다
// 파일외부비공개 접근수준 - fileprivate
// 그 요소가 구현된 소스파일 내부에서만 사용할 수 있다. 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 잇는 경우에 사용한다ㅏ.
// 비공개 접근수준 - private
// 가장 한정적인 범위.
// 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용할 수 없다?


