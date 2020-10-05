// 옵셔널 체이닝
// 옵셔널 변수나 상수 뒤에 물음표? 붙여서 표현
// nill 값이면 nil 반환하고 nil이 아니면 정상적인 값 반환하기
// 느낌표는 강제 추출이라서 옵셔널에 값이 없으면 런타임 오류가 발생할 수 있다

// MARK: - 예시 클래스로 옵셔널 체이닝 활용 사례 파악해보기

class Room {
    var number: Int
    
    init(number: Int){
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String){
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String){
        self.name = name
    }
}

// 옵셔널 체이닝의 사용
let yagom: Person = Person(name: "yagom")

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber) // 여기서 address 값이 nil값이므로 다음 building의 값 여부 체크할 필요 없이 nil 반환
} else {
    print("Can not find room number")
}

// 옵셔널 체이닝으로 값 할당 하기
yagom.address = Address(province: "서울시", city: "서초구", street: "신반포로", building: nil, detailAddress: nil)
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505 // 옵셔널 체인에 존재하는 프로퍼티의 값을 하나씩 할당해주기

// MARK: - 빠른 종료 guard
// if 문과 유사하게 bool 타입으로 동작하는 기능
// guard 뒤에 따라오는 옵셔널 바인딩 표현에서 옵셔널 값이 있는 상태라면 guard 구문이 실행된 아래 코드부터 함수 내부의 지역상수처럼 사용

func greet(_ person: [String: String]){
    guard let name: String = person["name"] else{
        return // name의 값이 없으면 아무것도 리턴하지 않음 -> nil
    }
}

