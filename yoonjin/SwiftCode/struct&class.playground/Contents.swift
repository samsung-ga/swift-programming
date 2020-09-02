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
