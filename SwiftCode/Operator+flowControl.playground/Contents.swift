// 삼항 조건 연산자
var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB
print(biggerValue)
valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB
print(biggerValue)
var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0
print(resultValue)
resultValue = stringB.isEmpty ? 1.0 : 0.0
print(resultValue)

// 오버플로 연산자
var unsignedInteger: UInt8 = 0
//let errorUnderflowResult: UInt8 = unsignedInteger - 1
let underflowedValue: UInt8 = unsignedInteger &- 1
print(underflowedValue)
unsignedInteger = UInt8.max
let overflowedValue: UInt8 = unsignedInteger &+ 1
print(overflowedValue)

// 스위프트 라이브러리에 기본적으로 정의된 연산자
// A ?? B : A가 nil이 아니면 A를 반환하고, nil이면 B를 반환합니다.
// -A : A의 부호를 변경합니다.
// O! : O의 값을 강제로 추출합니다.
// V? : V를 안전하게 추출하거나, V가 옵셔널임을 표현합니다.

// 전위, 후위, 중위 연산자

// if,switch 조건문
let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}
// swifch문에서 가장 큰 차이점은 break를 쓰지 않아도 반복실행이 되지 않는다. 반복실행을 원하면 fallthrough라는 키워드가 필요하다.
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
default:
    print("10 < Value <= 100")
}
// 튜플 + 스위치
typealias NameAge = (name: String, age: Int)
let tupleValue: NameAge = ("wody", 23)
switch tupleValue {
case ("wody", 23):
    print("맞음!!")
default:
    print("틀림")
}
switch tupleValue {
case ("wody", 2):
    print("맞음!!")
case ("wody", let age):
    print("이름만 맞음!, 나이는 \(age)임!")
default:
    print("틀림")
}
// 열거 + 스위치
enum School {
    case primary, elementary, middle, high, college, university, graduate, he
}
let 최종학력: School = School.he
switch 최종학력 {
case .primary:
    print("최종학력은 유치원입니다.")
case .college, .university:
    print("최종학력은 대학교입니다.")
case .middle:
    print("최종학력은 중학교입니다.")
case .elementary:
    print("최종학력은 초등학교입니다.")
case .high:
    print("최종학력은 고등학교입니다.")
case .graduate:
    print("최종학력은 대학원입니다.")
@unknown case _: // case default와 같다.
    print("unknown이라는 속성으로 열거형에 몇가지가 더 추가될경우 switch구문에 컴파일 오류가 발생하므로 미리 대비한다.")
}

// for-in 반복문
// 1
for i in 0...2 {
    print(i)
}
// 2
for i in 0...5 {
    if i.isMultiple(of: 2) {
        print(i)
        continue
    }
    print("\(i) == 홀수")
}
// 3
let helloSwift: String = "Hello Swift!"
for char in helloSwift {
    print(char)
}
// 4
var result: Int = 1
for _ in 1...3 {
    result *= 10
}
print("10의 3제곱은 \(result)입니다.")
// 5
let friends: [String: Int] = ["Jay": 35, "Joe": 29, "Jenny": 31]
for tuple in friends {
    print(tuple)
}
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064"]
for 번호 in 지역번호 {
    print(번호)
}

// while문
var names: [String] = ["Joker", "Jenny", "Nova", "wody"]
while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
}

// repeat-while문
names = ["Joker", "Jenny", "Nova", "wody"]
repeat {
    print("Good bye \(names.removeFirst())")
} while names.isEmpty == false

// 구문 이름표 : 반복문을 제어하는 키워드가 어떤 범위에 적용되어야 하는지 애매한 경우 사용된다. 예시로 이중포문일 때 내부 포문에서 break를 통해 외부 포문을 나오고 싶을 때 사용된다.
var numbers: [Int] = [3, 2342, 6, 3252]
numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
    
    var count : Int = 0
    
    printLoop: while true {
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break removeLoop
        }
        numbers.removeFirst()
    }
}
