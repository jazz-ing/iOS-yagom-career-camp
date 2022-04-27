 # 🎮 묵찌빠 프로젝트 저장소

## Flow Chart

![ios-rock-paper-scissors](https://user-images.githubusercontent.com/39452092/120315332-35d8d900-c317-11eb-894f-1db5dbc4ca44.png)

### 🤩 Details

- [draw.io](https://draw.io)를 통해 flow chart를 그림
- 각 함수별로 나누어서 그림
- Step1과 Step2를 합쳐서 작성함

&nbsp;

## Step1

### 📖 주요 학습 개념

* __`Enumeration`__

  * `An *enumeration* defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.`
  * 연관되어있는 값들을 그룹으로 묶어 (타입 세이프하게) 사용할 수 있도록 해준다.

  &nbsp;

  * __`rawValue`__
    * 원시값이라고 불리는 기본값을 각각의 case에 부여할 수 있다.
    * case와 1대1로 매칭되는 값이다. (상호 변환이 가능하다.)

  * __`associatedValue`__

    * 열거형 인스턴스를 생성할 때마다 case에 부여할 수 있는 각기 다른 값.

    &nbsp;

### 🧐 언제 rawValue를 쓰고 언제 associatedValue를 쓸까?

__❗️일단 두 value는 동시에 쓸 수 없다❗️__

```swift
enum Fruits: String {
  case apple(color: UIColor) = "사과"
}
```

위의 코드는 ⚠️__에러를 발생시킨다.__🚫

rawValue로 case를 얻어내고자 할 때 associatedValue를 알 수가 없기 때문!

* rawValue는 "'apple'은 '사과'이다."와 같이 해당 case가 원래부터 가지고 있어 변경이 불가능한 value가 존재할 때 사용하면 좋다.
* associatedValue는 case 인스턴스를 만들 때마다 각각 다른 값을 부여하고자 할 때 사용한다. (case와 연관하여 가질 수 있는 값인데 사용에 따라 변할 수 있는 값을 전달하고자 할 때)

&nbsp;

* __CaseIterable__
  * enum을 콜렉션으로 다루고자 할 때 사용하는 protocol
  * enum에 이 프로토콜을 채택시키면 allCases라는 프로퍼티로 case에 대한 배열을 받을 수 있다.
  * 컴파일러가 `CaseIterable`에서 요구하는 구현을 제공하므로 별다른 코드를 추가해주지 않아도 된다. 

* __CustomStringConvertible__
  * 인스턴스를 문자열로 출력하고자 할 때 그 출력 형태를 커스터마이징 할 수 있게 해주는 protocol
  * struct, class, enum에 이 프로토콜을 채택시키고 description이라는 연산프로퍼티를 구현하면 된다.

&nbsp;

* __전역 변수는 피하도록 하자!__

  * 객체지향프로그래밍은 객체간의 상호작용으로 프로그램을 만드는 것인데 전역변수는 이에 맞지 않는다.

  * 프로그램의 크기가 커졌을 때 값이 어떻게 변하였는지, 어디서 사용되고 있는 것인지 추적하기 어렵다.

  * __전역변수(상수)는 struct, class, enum으로 감싸서 사용하자.__ 특히 `enum` 과 사용하면 금상첨화!

    * `static var` 또는 `static let` 프로퍼티 형태로 선언을 해주게 되는데 enum은 case-less의 경우 실수에 의한 인스턴스 생성을 막을 수 있기 때문.

    ```swift
    enum Numbers {
      static let one = 1
      static let two = 2
      ...
    }
    
    let numbersInstance = Numbers() // error: 'Numbers' cannot be constructed because it has no accessible initializers
    ```

    &nbsp;



* __매직 넘버도 피하도록 하자!__ 
  * 매직 넘버는 코드 중간에 갑자기 등장하는 상수를 의미한다. (문자의 경우 매직 리터럴이라고 한다.)
  * 매직 넘버를 사용하게 되면 코드를 알아보기도, 유지보수하기도 힘들어진다.

&nbsp;

* __재귀 함수__

  * [컴퓨터 과학](https://ko.wikipedia.org/wiki/컴퓨터_과학)에 있어서 **재귀**(再歸, Recursion)는 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻하며, 이를 프로그래밍에 적용한 **재귀 호출**(Recursive call)의 형태로 많이 사용된다.

    > [재귀 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9E%AC%EA%B7%80_(%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99))

  * 반복문을 사용하는 것보다 코드가 짧고 간결해진다는 장점이 존재한다.

  * 함수를 호출하는 과정에서 오버헤드가 계속 발생하고, 스택오버플로우의 위험이 존재한다. 

  * 스택프레임을 구성하고 해제하는 시간이 추가적으로 필요하므로 일반적인 반복문보다 느리다는 단점이 있다.

  &nbsp;

* __함수는 최대한 쪼개도록 하자!__
  * 사용자에게서 입력을 받거나 콘솔에 출력하는 아주 간단한 함수라고 하더라도 가독성, 확장성을 고려한다면 별도의 함수로 감싸서 작성하는 것이 좋다. (의미면에서도 더 명확할 것이다.)

