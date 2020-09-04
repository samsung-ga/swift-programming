// 기본적인 함수의 정의와 호출
func hello(name: String) -> String {
    return "Hello, \(name)"
}
let helloJaeyong: String = hello(name: "Jaeyong")
print(helloJaeyong)

// return 생략 가능
func introduce(name: String) -> String {
    "제이름은 " + name + "입니다."
}
let introduceJaeyong: String = introduce(name: "Jaeyong")
print(introduceJaeyong)

// 매개변수 이름과 전달인자 레이블을 가지는 함수 정의와 사용
func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}
print(sayHello(from: "Jaeyonh", to: "you"))

// 전달인자 레이블이 없는 경우
// 매개변수 기본값이 있는 함수의 정의와 사용
func sayHello(_ name: String, _ times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}
print(sayHello("Choppa", 5))

// 가변 매개변수와 입출력 매개변수
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}
print(sayHelloToFriends(me: "Jaeyong", friends: "Yoonjae", "Yoonjin", "Hosae"))
print(sayHelloToFriends(me: "Jaeyong"))
var numbers: [Int] = [1, 2, 3]
func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}
func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}
nonReferenceParameter(numbers)
print(numbers[1])
referenceParameter(&numbers)
print(numbers[1])

// 데이터 타입으로서의 함수
typealias CalculateTwoInts = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}
var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2,5))
mathFunction = multiplyTwoInts
print(mathFunction(2,5))
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) -> Void {
    print("\(mathFunction(a,b))")
}
printMathResult(addTwoInts(_:_:), 5, 3)
printMathResult(multiplyTwoInts(_:_:), 5, 3)

// 함수 중첩
typealias MoveFunc = (Int) -> Int
func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    return shouldGoLeft ? goLeft(_:): goRight(_:)
}
var position: Int = -4
let moveToZero: MoveFunc = functionForMove(position > 0)
while position != 0 {
    print("\(position)")
    position = moveToZero(position)
}
print("원점 도착!")

// 종료되지 않는 함수
func crashAndBurn() -> Never {
    fatalError("Something very, very bad happend")
}
//crashAndBurn()
func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!!")
        crashAndBurn()
    }
    print("All is Well")
}
someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false)

// 반환 값을 무시할 수 있는 함수
func say(_ something: String) -> String {
    print(something)
    return something
}
@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}
say("hello")
discadableResultSay("hello")

// 옵셔널(Optional)
// 옵셔널은 "선택적인" 즉 값이 '있을 수도, 없을 수도 있음'을 나타내는 표현입니다. 이는 '변수나 상수 등에 꼭 값이 있다는 것을 보장할 수 없다. 즉, 변수 또는 상수의 값이 nil일 수도 있다'는 것을 의미합니다.
// 옵셔널은 열거형으로 정의되어 있다.
var myName: String? = "jaeyong"
print(myName)
//myName = nil
//print(myName)
// 옵셔널 추출하기
// 1. 강제 추출
var jaeyong: String = myName!
// 2. 옵셔널 바인딩
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}
if var name = myName {
    name = "wody"
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// 3. nil 병합 연산자
// Optional ?? Value
var nickname: String? = "wody"
var name: String
name = nickname ?? ""
print(name)
nickname = nil
name = nickname ?? "it's nil"
print(name)
// 옵셔널 바인딩, nil 병합 연산자를 비롯해 뒤에서 배울 옵셔널 체이닝 등의 방법을 사용하는 편이 훨씬 안전합니다.

