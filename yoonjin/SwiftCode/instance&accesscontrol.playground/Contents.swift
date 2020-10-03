
//MARK: - 인스턴스 생성 및 소멸
// 이니셜라이저
// 처음 생성할 때 초깃값 할당해야한다

struct Area{
    var squareMeter: Double // 바로 0.0 으로 선언하여 기본값 할당시킬 수도 있음. 이건 개발자 마음
    init(){
        squareMeter = 0.0 // init으로 인스턴스 초기화하기
    }
    
    // 매개변수를 가지는 이니셜라이저
    init(value: Double){
        squareMeter = value
    }
    
}
let room: Area = Area()
let roomvalue: Area = Area(value: 30.0)
print(room.squareMeter) // 0.0


class Person{
    var name: String
    var age: Int? // 옵셔널로 선언한 저장 프로퍼티
    
    init(name: String){
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.age) // 초기화 안했으므로 nil로 자동 할당

//MARK: - 멤버와이즈 이니셜라이저, 실패가능ㅎ안 이니셜라이저
// 구조체에서 유효, 구조체 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)

// 인스턴스 초기화에 실패하는 경우를 고려하는 실패 가능한 이니셜라이저
/*
init?(myname: String){
    if myname.isEmpty{
        return nil // 특정 값을 반환하지 않는다. 초기화 실패
    }
    self.myname = myname //초기화 성공
}
 */

// MARK: - 인스턴스 소멸
class SomeClass {
    deinit {
        print("인스턴스 소멸")
    }
    
}

var instance: SomeClass? = SomeClass()
instance = nil // 디이녀셜라이저는 클래스의 인스턴스에서만 구현 가능, 메모리 소멸
