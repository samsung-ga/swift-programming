

- 옵셔널 체이닝



## 옵셔널 체이닝

옵셔널 체이닝의 사용

```swift
class Room {
  var number: Int 
  
  init(number: Int) {
    self.number = number
  }
}

class Building {
  var name: String
  var room:  Room?
  
  init(name: String) {
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
  
  init(name: String) {
    self.name = name
  }
}

let jaeyong: Person = Person(name: "jaeyong")
let jaeyongRoomViaOptionalChaining: Int? = jaeyong.address?.building?.room?.number
```

옵셔널 체인과 옵셔널 바인딩의 사용

```swift
if let roomNumber = jaeyong.address?.building?.room?.number {
  print(roomNumber)
} else {
  print("Error")
}
```

빠른 종료 -> guard let 구문

```swift
guard Bool 타입 값 else {
	예외사항 실행
}
```

```swift
guard let location: String = person["location"] else {
  return // 블록 내부는 자신보다 상위의 코드 블록을 종료하는 코드가 들어가야한다.
}

// 아래와 같이 , 를 이용해 &&처럼 사용할 수 있다.
guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
  print("Too Young")
  return
}
```

