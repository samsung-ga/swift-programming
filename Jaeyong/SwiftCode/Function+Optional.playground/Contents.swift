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
