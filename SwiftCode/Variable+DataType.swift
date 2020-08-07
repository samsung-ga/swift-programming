/*
 대문자 카멜케이스
 : Int, Double, ViewController
 소문자 카멜케이스
 : nameLabel, numToPick
 */

// 변수 선언하기
var name: String = "jaeyong"
var age: Int = 100
var job = "iOS Programmer" // 타입 추론이 사용되었습니다..
var height = 177.1
print("\(type(of: height))")
print()
age = 99
job = "Writer"
print("저의 이름은 \(name)이고, 나이는 \(age)세입니다. 직업은 \(job)이고, 키는 \(height)센티미터입니다.")
print()
// 상수 선언하기
let nickname: String = "wody"
job = "Server Programmer"

// ❌
//nickname = "우디" 오류 발생

print("저의 이름은 \(nickname)이고, 나이는 \(age)세입니다. 직업은 \(job)이고, 키는 \(height)센티미터입니다.")
print()

// 데이터 타입
// 스위프트의 모든 데이터 타입 이름은 대문자 카멜케이스를 사용합니다.
// Int
var integer: Int = -100
let unsignedInteger: UInt = 50 // UInt 타입에는 음수값을 할당할 수 없습니다.
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")
print()
// ❌
//let tooLarge: Int = Int.max + 1 // Int 범위 초과하므로 오류
//let cannotBeNegetive: UInt = -5 // UInt는 음수가 될 수 없으므로 오류
let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100 // 2진수
let octalInteger: Int = 0o34 // 8진수
let hexadecimalInteger: Int = 0x1C // 16진수
// Bool
var boolean: Bool = true
boolean.toggle()
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = true
print("시간은 무한합니까? \(isTimeUnlimited)")
print()
// Float, Double
var floatValue: Float = 1234567890.1
var doubleValue: Double = 1234567890.1
print("floatValue: \(floatValue) doubleValue: \(doubleValue)")
// Random
print(Int.random(in: -100...100))
print(UInt.random(in: 1...30))
print(Double.random(in: 1.4...3.4))
print(Float.random(in: -9.4...5))
print()
// Character
let alphabetA: Character = "A"
print(alphabetA)
let commandCharacter: Character = "🙌"
print(commandCharacter)
let 한글변수이름: Character = "ㄱ"
print(한글변수이름)
// String
let test: String = "jay"
var introduce: String = String()
introduce.append("제 이름은")
introduce = introduce + " " + test + "입니다."
print(introduce)
// String 타입에는 기본적으로 많은 메서드와 프로퍼티들이 구현되어 있습니다.
// 접두어, 접미어 확인
var hello: String = "Hello"

var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)
hasPrefix = hello.hasPrefix("SHE")
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)
hasSuffix = hello.hasSuffix("O")
print(hasSuffix)

// 메소드를 통한 대소문자 변환
var convertedString: String = ""
convertedString = hello.uppercased()
print(convertedString)
convertedString = hello.lowercased()
print(convertedString)

// 프로펄티를 통한 빈 문자열 확인
var isEmptyString : Bool = false
isEmptyString = hello.isEmpty
print(isEmptyString)
hello = ""
print(hello.isEmpty)

// 문자열 길이 확인
hello = "hello"
print(hello.count)

// Any, AnyObject, Nil
var someVar: Any = "this is string"
someVar = 4
someVar = 39.1
// nil은 "없음"의 의미로 이 메모리에 접근할 경우 런타임에러가 나온다.

// 타입별칭
typealias MyInt = Int
typealias Long = CLongLong

// 튜플 : 지정된 데이터의 묶음
var person: (String, Int, Double) = ("wody", 23, 177.1)
print("name: \(person.0), age: \(person.1), height: \(person.2)")
var student: (name: String, number: Int, score: Double) = ("wody", 1, 93.4)
print("name: \(student.name), age: \(student.number), height: \(student.score)")
typealias Student = (name: String, number: Int, score: Double)
let jaeyong: Student = ("Jaeyong", 1, 23.1)
let mike: Student = ("Mike", 2, 324)
print("name: \(jaeyong.name), age: \(jaeyong.number), height: \(jaeyong.score)")
print("name: \(mike.name), age: \(mike.number), height: \(mike.score)")

// 배열
var test2: Array<String> = ["wody", "yagom", "hereismyid", "sery"]
var test3: [String] = ["wody", "yagom", "hereismyid", "sery"]
var emptyArray: [Any] = [Any]()
var emptyArray1: [Any] = Array<Any>()
var emptyArray2: [Any] = []
print(test2[2])
test2[2] = "jenny"
print(test2[2])
// ❌
// print(test2[4])
// test2[4] = "elsa"
test2.append("Elsa")
test2.append(contentsOf: ["h", "j"])
test2.insert("happy", at: 2)
print(test2)
test2.insert(contentsOf: ["jinhee", "kyubin"], at: 2)
print(test2)
print(test2[4])
print(test2.firstIndex(of: "jinhee"))
print(test2.lastIndex(of: "jinhee"))
print(test2.first)
print(test2.last)
let firstItem: String = test2.removeFirst()
let lastItem: String = test2.removeLast()
let indexOneItem: String = test2.remove(at: 1)
print(firstItem)
print(lastItem)
print(indexOneItem)
print(test2[0...2])

// 딕셔너리 : 순서없이 키와 값의 쌍으로 이루어진 컬렉션 타입이고, 중복된 같은 키 값이름을 가지면 안된다.
typealias StringIntDictionary = [String: Int]
var numberForName1: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2: [String: Int] = [String: Int]()
var numberForName3: StringIntDictionary = StringIntDictionary()
var numberForName4: [String: Int] = [:]
var numberForName: [String: Int] = ["jaeyong": 100, "yagom": 200, "jenny": 300]
print(numberForName.isEmpty)
print(numberForName.count)
print(numberForName["jaeyong"])
print(numberForName["wody"]) // 배열과 다르게 nil값을 반환한다.
numberForName["jaeyong"] = 1000
print(numberForName["jaeyong"])
numberForName["max"] = 99
print(numberForName["max"])
print(numberForName.removeValue(forKey: "jaeyong"))
print(numberForName.removeValue(forKey: "jaeyong"))
print(numberForName["jaeyong", default: 0])

// 세트 : 순서가 중요하지 않은 각 요소가 유일한 값이어야 하는 경우 사용 가능한 컬렉션 타입이다.
var setNames1: Set<String> = Set<String>()
var setNames2: Set<String> = []
var setNames: Set<String> = ["wody", "yagom", "jenny", "wody", "yagom"]
var numbersTest = [100,200,300]
print(type(of: numbersTest))
print(setNames.count)
print(setNames.isEmpty)
setNames.insert("max")
print(setNames.count)
print(setNames.remove("max"))
print(setNames.count)
// 집합연산
let englishClassStudents: Set<String> = ["wody", "yagom", "max"]
let koreanClassStudents: Set<String> = ["wody", "yagom", "jenny", "mike", "john"]
let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents) // 교집합
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents) // 여집합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents) // 합집합
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)
print(intersectSet)
print(symmetricDiffSet)
print(unionSet)
print(subtractSet)
print(unionSet.sorted())
let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)
print(새.isDisjoint(with: 포유류)) // 서로 배타적인지
print(새.isSubset(of: 동물)) // 부분집합인지
print(동물.isSuperset(of: 새)) // 전체집합인지
print(동물.isSuperset(of: 포유류))

// 열거형 : 연관된 항목들을 묶어서 표현할 수 있는 타입입니다. 하지만 미리 정의해준 항목 값 외에는 추가/수정/삭제가 불가합니다.
// 기본 열거형
enum School1 {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}
enum School2 {
    case primary, elementary, middle, hight, college, university, graduate
}
var highestEducationLevel: School1 = School1.university
var highestEducationLevel1: School1 = .university
highestEducationLevel1 = .graduate
// 원시 값 - rawValue
enum School3: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate // 원시 값을 선언 안해준다면 항목 이름 그대로 원시 값이 되고, int인 경우 +1씩 원시 값이 됩니다.
}
let highestEducationLevel2: School3 = .university
print("저의 최종학력은 \(highestEducationLevel2.rawValue) 졸업입니다.")
enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}
let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)요일입니다.")
let primary = School3(rawValue: "초등학교")
let graduate = School3(rawValue: "석박사")
// 연관 값 - 열거로 선언한 값이 또 값을 가짐
enum PastaTaste {
    case cream, tomato
}
enum PizzaDough {
    case cheeseCrust, thin, original
}
enum PizzaTopping {
    case pepperoni, cheese, bacon
}
enum MainDish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSause: Bool)
    case rice
}
var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
// 항목 순회 - CaseIterable 프로토콜
enum School4: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate
}
let allCasese: [School4] = School4.allCases
print(allCasese)
// 하지만 플랫폼별로 사용 조건을 추가하는 경우가 있으므로 allCases는 주의해주어야합니다.
// 순환 열거형 - 열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용한다.
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let six = ArithmeticExpression.number(6)
let sum = ArithmeticExpression.addition(five, six)
let result = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(5))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(result))
