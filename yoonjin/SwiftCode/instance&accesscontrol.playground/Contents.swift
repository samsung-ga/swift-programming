
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

//MARK: - 접근제어
// 은닉화와 연관, 파일 간 또는 모듈 간 접근을 제한하는 기능
// 외부에서 접근하면 안되는 코드의 경우 접근 제어를 통해 노출 가능성을 막을 수 있음

// 접근 수준
// open : 모듈 외부, 클래스에서만 사용 - private보다도 높은 접근 수준. 클래스를 Open으로 명시하면 다른 모듈에서도 부모 클래스로 사용하겠다는 목적으로 클래스를 설계하고 코드를 작성한 것
// public : 모듈 외부 - swift의 기본 요소들은 모두 공개 접근 수준으로 구현되어있다고 보면 된다
// 내부 접근 수준의 internal - 얘는 그냥 암묵적인 거임. 기본 상태라고 보자
// 파일 외부 비공개 접근 수준의 fileprivate - 이렇게 선언된 요소가 구현된 소스 파일 내부에서만 사용 가능
// 비공개 접근 수준의 private - 가장 한정적. 소스 파일 내에 구현한 다른 타입이나 기능에서도 사용할 수 없음. 한 메서드 안에서만 지정해놓으면 메서드 외부에서는 사용 불가

// 국룰 : 상위 요소보다 하위 요소가 더 높은 접근 수준을 가질 수 없다. 클래스를 비공개 접근으로 만들어버리면 해당 클래스의 메서드들도 비공개라서 외부에서 접근 불가


// 읽기 전용 구현 - 값 변경 제한하기
// 설정자의 접근 수준을 낮추기

