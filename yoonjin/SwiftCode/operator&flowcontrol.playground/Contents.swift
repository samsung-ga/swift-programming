import UIKit

// MARK: - nil병합연산자?? , 옵셔널연산자?
var someOptionalInt: Int? = nil // V? : 옵셔널 값을 안전하게 추출하거나 V가 옵셔널임을 명시

let value: Int = someOptionalInt != nil ? someOptionalInt!: 0
let valueInt: Int = someOptionalInt ?? 0 // A ?? B : A가 nil이 아니면 A값 반환하고 nil값이면 B를 반환한다

// MARK: - 반복문(Switch)

let integerValue: Int = 5

switch integerValue{
case 0:
    print("value == zero")
case 1...10:
    print("value == 1~10") //1...10은 1이상 10이하, 여러개의 항목을 한 번에 case로 지정해주는 것도 가능
    fallthrough // fallthrough, 무조건 다음 case 실행
case Int.min..<0, 101..<Int.max:
    print("value <0 or Value >100")
    break
default:
    print("10<value <=100")
}

// 튜플과 와일드카드식별자(_)활용한 switch문, 와일드카드 식별자란 말그대로 와일드카드 느낌임 -> 아무값이나 받아오는 거 가능하다
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("윤진",23)
switch tupleValue {
case("윤진",23):
    print("correct")
case("윤진",_):
    print("이름만 맞음. 나이는 \(tupleValue.age)")
case(_,23):
    print("나이만 맞음. 이름은 \(tupleValue.name)")
default:
    print("사람 잘못 봤음")
}

// 열거형 switch문
enum Menu {
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .chicken

switch lunchMenu{
case .chicken:
    print("치즈볼 추가")
case .pizza:
    print("갈릭디핑소스 추가")
@unknown case _: // 추후 코드 수정 시 열거형에 추가한 케이스를 고려하지 않고 switch문에 케이스를 추가하지 않았다면 경고문 출력하도록 설정
    print("오늘 메뉴가 뭐죠")
}
// MARK: - 반복문(for)

// 시퀀스에 해당하는 값이 핑료 없다면 _ 사용가능
var result: Int = 1

for _ in 1...3 {
    result *= 10
}
print("10의 3제곱은 \(result)입니다.")

let friends:[String:Int] = ["h":23,"s":23,"k":24] //딕셔너리 사용
for tuple in friends{
    print(tuple)
}

//MARK: - repeat-while구문
//do-while문이랑 같음

var names: [String] = ["h","k","s","y"]

repeat {
    print("remove \(names.removeFirst())")
}while names.isEmpty == false //repeat 구문 무조건 한번 실행, while 조건 성립하는동안 반복 실행

//MARK: - 함수

// 매개변수 2개 함수
func sayHello(myName: String, yourName: String) -> String{
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello(myName: "yoonjin", yourName: "profitjean"))

// 전달인자 레이블을 가지는 함수
func sayHi(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHi(from: "profitjean", to: "yoonjin"))

// 전달인자 레이블 변경을 통한 오버로드(함수 중복 정의)
func sayName(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)!" + ""
    }
    return result
}

func sayName(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)!" + ""
    }
    return result
}

print(sayName(to: "chope", 2))
print(sayName(to: "chope", repeatCount: 2))

// 매개변수 기본값 있는 함수의 정의

func sayName(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + ""
    }
    
    return result
}

print(sayName("profitjean")) // 기본이 3번이니까 세 번 출력
print(sayName("profitjean", times: 2))

// 입출력inout 매개변수의 활용

var numberset: [Int] = [1,2,3]

func nonReferenceParameter(_ arr: [Int]){
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]){
    arr[1] = 1
}

nonReferenceParameter(numberset)
print(numberset[1])

referenceParameter(&numberset)
print(numberset[1])

// 반환 값 없는 void 함수, swift 문법내에서는 void 생략 가능!
func say(){
    print("Hello, World!")
}

//함수 타입의 사용
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b:Int) -> Int{
    return a + b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2,5))

mathFunction = multiplyTwoInts
print(mathFunction(2,5)) // 10

// 전달인자로 함수를 전달받는 함수
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int){ //더하기 연산 진행
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 4)

// MARK: - optional
// 옵셔널의 정의: 값이 있을 수도, 없을 수도 있음. 선택적인 표현임

var myName: String? = "yoonjin"
print(myName) // Optional("yoonjin")
myName = nil // nil은 위의 myName변수처럼 ?사용해서 옵셔널 선언된 곳에서만 사용될 수 있다.
print(myName)


// 옵셔널 강제 추출 *위험한 방식. 런타임 오류 일어날 가능성 가장 높음*
// 엑코 자동으로 오류 수정할 때 ! 찍어주는 것 -> 옵셔널 강제 추출

var name1: String? = "yoonjin"

var yoonjin: String = name1! // 변수 yoonjin은 옵셔널이 아닌 변수이므로 옵셔널 변수인 name1을 추출하여 할당해준다.

name1 = nil
// yoonjin = name1! -> 런타임오류 발생

// 옵셔널 바인딩. if 구문을 통해 nil값 먼저 체크 ~~
// 옵셔널 바인딩을 통한 임시 상수(let) 할당
var myName2: String? = "profitjean"
if let name2 = myName2{
    print("My name is \(name2)")
}else {
    print("myName2 == nil")
}

// 암시적 추출 옵셔널
// ! 사용, 일반 값처럼 사용할 수 있으나, 여전히 옵셔널이기 때문에 nil값도 할당해줄 수 있다
var myName3: String! = "yoonjinlee"
print(myName3)
