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


