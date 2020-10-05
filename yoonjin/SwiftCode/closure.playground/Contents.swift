// 클로저 - 변수나 상수가 선언된 위치에서 참조를 획득하고 저장 할 수 있음
// 사실상 가독성을 높이기 위해 다르게 표현되는 방식이라고 보는 편이 더 이해하기 쉬운 것 같다

// 함수 또한 클로저의 기본 형태
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let names = ["yoonjin", "profitjean"]
let reversed: [String] = names.sorted(by: backwards)
// MARK: - 기본 구조
let c_reversed: [String] = names.sorted(by: {(first: String, second: String) -> Bool in
    return first > second
}) // 위에서 선언된 backwards 함수와 다른게 없음

// MARK: - 후행 클로저
// 위에서 만든 기본 구조를 좀 더 쉽게 바꾼 형태

let t_reversed: [String] = names.sorted {(first,second) -> Bool in // 매개변수 타입, 반환 타입 생략 가능
    return first > second
}

// MARK: - 클로저 표현의 간소화
let short_reversed: [String] = names.sorted{
    return $0 > $1 // 달러 사인과 숫자 조합으로 표현하면 알아서 몇 번째 전달인자인지 판단 가능
}

// return 타입도 생략시키기 가능
let ss_reversed: [String] = names.sorted{$0 > $1}

// MARK: - 클로저에서 값 얻어오기
// 클로저는 비동기 작업에서 많이 사용되기 때문에 상수나 변수가 더 이상 존재하지 않더라도 해당 상수나 변수의 값을 자신 내부에서 참조하거나 수정할 수 있음
// 중첩함수를 통해 활용 가능

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int { // 중첩 함수도 클로저의 일종, 함수 객체 반환하는 의미
        runningTotal += amount // 중첩 함수 주변에 변수가 존재해야 참조하여 실행 가능
        return runningTotal
    }
    return incrementer
}
// MARK: - escaping closure
// 컴플리션 핸들러(골벵이) 활용
// 비동기 작업으로 함수 종료되고 난 후 호출할 필요가 있는 클로저를 사용

// MARK: - 자동 클로저
// 전달 인자 안가지고 호출되었을 때 자신이 감싸고 있는 코드의 결괏값을 반환한다
// 연산 지연을 위해 많이 사용된다 << 클로저가 호출되기 전까지 클로저 내부의 코드는 동작하지 않아

// 연산 지연
var customersInLine: [String] = ["y","s","sung","h"]
print(customersInLine.count)

let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}

print(customersInLine.count)
//print("Now Serving \(customerProvider())!") // 직접 호출해줘야 removeFirst() 실행되는 것
print(customersInLine.count)

func serveCustomer(_ customerProvider: @autoClosure () -> String) { // 스트링값으로 전달된 전달인자가 자동으로 클로저로 변환된다
    print("Now Serving \(customerProvider())!")
}

serveCustomer(customersInLine.removeFirst())

