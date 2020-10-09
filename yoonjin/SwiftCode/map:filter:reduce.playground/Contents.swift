// MARK: - map
// 맵 - 함수의 일종. 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수
// 기존 데이터를 변형하는데 많이 사용된다
// for - in 구문과 차이 없음

let numbers: [Int] = [0,1,2,3,4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

// map 메서드 사용
// 위에서 작성한 for - in 구문처럼 append 해주고 번거로운 과정이 빠진다
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// 클로저 표현의 간략화
doubledNumbers = numbers.map({ return $0 * 2})
print(doubledNumbers)

// MARK: - 다양한 컨테이너 타입에서의 맵의 활용
let alphabetDictionary: [String:String] = ["a":"A","b":"B"]

var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> // 키 값
    String in
    return tuple.0
}

keys = alphabetDictionary.map{$0.0}

let values: [String] = alphabetDictionary.map{ $0.1 }
print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0*2 }
print(resultSet)


let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0*2 }
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2}
print(resultRange)
// MARK: - filter
// 맵과의 차이는, 특정 조건에 맞게 걸러내는 역할을 할 수 있다는 점
// 리턴 타입도 bool, 조건에 맞으면 true, 아니면 false 반환

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter{$0 % 2 == 1}
print(oddNumbers)

// MARK: - reduce
// 배열 및 함수 등 내부의 모든 값을 하나로 합쳐주는 기능

