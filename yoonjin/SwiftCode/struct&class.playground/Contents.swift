//MARK: - struct, 구조체(값 타입)

struct BasicInformation{ // 구조체 명명법, 구조체 이름은 대문자 카멜케이스
    var name: String // 구조체 프로퍼티와 메서드들은 소문자
    var age: Int
}

// 구조체 인스턴스 생성...서버통신떄 맨날 쓰는방식...
var infoBasic: BasicInformation = BasicInformation(name: "yoonjinlee", age: 23 )
infoBasic.name = "profitjean"
infoBasic.age = 22
// var로 선언되었으므로 값 변경 가능함, 만약 let이었다면 변경 불가능

// MARK: - class(참조 타입)
// 클래스 정의
class Person{
    var height: Float = 0.0
    var weight: Float = 0.0
}

// 클래스 인스턴스 생성 및 사용
var yoonjin: Person = Person() // 인스턴스의 생성
yoonjin.height = 100.0
yoonjin.weight = 10.0

// 값,참조타입 다시 보기
var friendBasic: BasicInformation = infoBasic // 이건 infoBasic의 값을 복사하여 할당(구조체)
var profitjean: Person = yoonjin // 인스턴스 '윤진'의 참조를 할당
print(profitjean.height)
print(profitjean.weight)

// MARK:- 저장 프로퍼티
struct CoordinatePoint{
    var x: Int
    var y: Int
}

let placePoint: CoordinatePoint = CoordinatePoint(x:20, y:4) // 만약 구조체에서 값 할당해줬으면 전달인자로 초깃값 넘겨줄 필요가 없음. 못 쓴다는 이야기는 아님


class Position{ // 이니셜라이저 정의 안해주면 오류남! 이니셜라이저로 기본값 정의해줘야한다
    var point: CoordinatePoint
    let name: String
    var optionalPoint: CoordinatePoint? // 옵셔널로 지정 가능
    init(name: String, currentPoint: CoordinatePoint){
        self.name = name
        self.point = currentPoint
    }
}

let placePosition: Position = Position(name: "yoonjin lee", currentPoint: placePoint) // 이니셜라이저 호출

// MARK: - 연산 프로퍼티(접근자, 설정자)

struct getSetCoordinatePoint{
    var xp: Int
    var yp: Int
 
    var oppositePoint: getSetCoordinatePoint{
        get{ //접근자
            return getSetCoordinatePoint(xp: -xp, yp: -yp)
        }
        
        set(opposite){ //설정자
            xp = -opposite.xp
            yp = -opposite.yp
        }
    }
    
}

var maPosition: getSetCoordinatePoint = getSetCoordinatePoint(xp: 10, yp: 20)

print(maPosition.oppositePoint)

// MARK: - 프로퍼티 감시자

// 프로퍼티 값이 새로 할당될 때마다 호출
// willSet, didSet메서드

class Account {
    var credit: Int = 0 {
        willSet{ // 프로퍼티가 변경될 값
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정")
        }
        didSet{ // 프로퍼티가 변경되기 전의 값
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다")
        }
    }
    
}

// MARK: - 인스턴스 메서드
// 함수랑 형식 차이가 있는건 아닌데, 특정 타입 내부에 존재한다는 것이 큰 차이

class LevelClass {
    
    var level: Int = 0 { // 현재 레벨 저장하는 저장 프로퍼티
        didSet{
            print("Level \(level)") // 프로퍼티 값 변경되면 호출하는 프로퍼티 감시자
        }
    }
    func levelUp(){ // 레벨 올랐을 때 호출하는 메서드
        print("Level Up!")
        level += 1
    }
    
    func levelDown(){ // 레벨 내려갈 때 호출하는 메서드
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    func jumpLevel(to: Int){ // 특정 레벨로 이동할 때 호출되는 메서드
        print("Jump to \(to)")
        level = to
    }
    func reset(){ // 레벨 초기화
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()


// MARK: - self 프로퍼티
// 모든 인스턴스는 암시적으로 생성된 self 프로퍼티를 갖는다. 자바의 this와 비슷
class LevelClassSelf {
    var level: Int = 0 // 인스턴스 프로퍼티
    
    func jumpLevel( level: Int){
        print("Jump to \(level)")
        self.level = level // 매개변수 level과 인스턴스 프로퍼티 level 간 구별하기 위함
        // self.level 이 인스턴스 프로퍼티임
    }
}

// 값 타입 인스턴스 자체의 값 치환
// 이게 뭔 개소리냐하면, 구조체나 열거형에서 self로 자기 자신을 치환할 수 있다는 말

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level = level + 1
    }
    mutating func reset() {
        print("Reset!")
        self = LevelStruct() // 이렇게 구조체 자기 자신이 self로 지환 가능하다,,,
    }
}
