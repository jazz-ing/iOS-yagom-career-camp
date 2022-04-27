# 🌐 만국박람회 프로젝트

**프로젝트 기간: 2021년 7월 5일 ~ 7월 16일**

*with Coden, Namu, Nala*

## Flow Chart

<img width="435" alt="만국박람회 Flow Chart" src="https://user-images.githubusercontent.com/39452092/124571207-8c8b8280-de82-11eb-8945-15dffa4a23e8.png">
&nbsp;   

## UML - 수정 전

<img width="707" alt="만국박람회 UML 수정 전" src="https://user-images.githubusercontent.com/39452092/124571259-98774480-de82-11eb-8082-4a2292bc7084.png">

&nbsp; 

## UML - 수정 후

<img width="1141" alt="만국박람회 UML 수정 후" src="https://user-images.githubusercontent.com/39452092/125980544-1402b47e-07a8-4ca0-9b7a-b1222e8bdf98.png">

&nbsp;

## STEP1 - Model 구현

### 📖 주요 학습 개념

#### `Codable`

- Codable이 선언된 형태

```swift
typealias Codable = Decodable & Encodable
```

- `Decodable` 또는 `Encodable` 둘 중 하나의 프로토콜만 채택하는 경우 해당 타입이 특정 목적으로만 사용된다는 것을 명시할 수 있게 된다. (디코딩 또는 인코딩 목적으로만 사용된다!)
- `Codable`을 채택하는 경우 인코딩과 디코딩이 모두 가능한 상태가 된다. 
- Codable은 **Struct만 채택이 가능한 프로토콜**이며 **구조체 내부의 모든 프로퍼티들이 Codable을 준수**하여야만 한다. 

&nbsp; 

#### `CodingKey`

* json에서의 키값과 struct의 프로퍼티명이 일치하지 않는 경우 유용한 프로토콜

* 이 프로토콜을 채택하는 enum은 이름을 `CodingKeys`라고 해야 한다. 

  ➡️ 왜 이름이 `CodingKeys`이어야 하는지에 대해 의문을 가졌었고 이에 대한 의논이 이루어졌던 [링크](https://forums.swift.org/t/rename-encodable-codingkeys/30571/6)를 얻을 수 있었다. 

* CodingKeys는 Codable struct의 Nested Type으로써 UML에 작성해주었었는데 이는 적절치 못하다고 한다. Codable struct가 이 enum을 쓴다기보다는 Codable 자체에서 쓰이는 부분이라서! ➡️ UML 수정을 하면서 삭제

&nbsp;

#### Contents.json

```swift
{
  "data" : [
    {
      "filename" : "뭐시기뭐시기.json",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

* Asset에 데이터를 추가하는 경우 자동으로 생성되는 파일
* 데이터에 대한 데이터, 메타데이터 파일이다. 
* 이 친구는 Model 타입을 따로 만들어줄 필요가 없다. 

<br/>

## STEP2 - TableView

<img src="https://user-images.githubusercontent.com/39452092/126313127-869f7e74-6d86-400f-afef-f16186d3b4a5.gif" width=300 height=600 />

<br/>

### 📖 주요 학습 개념

* Coden이 그려본 Sequence Diagram

  <img src="https://user-images.githubusercontent.com/39452092/125982468-c6a08509-cd85-42e1-bce1-cccc01270419.png" width=700 />

&nbsp;

* Coden이 그려본 Delegate에 대한 Class Diagram

  <img src="https://user-images.githubusercontent.com/39452092/125983592-528a5d38-544b-4526-96a5-e2f4c570d4a9.png" width=800 />

  **`AnyObject`가 있는 이유**

<table>
  <tr>
    <td>
Protocol이 AnyObject를 상속하면 해당 프로토콜은 클래스만 채택할 수 있게 됩니다.<br/>
이는 `Object와 DelegateObject간 순환참조`가 발생하는 것을 막기위함입니다. <br/>
위에 제가 그린 UML에도 나와있듯이 SomeObject와 DelegateObject는 순환참조가 발생할 가능성이 존재합니다.(서로를 참조하는 화살표가 존재) <br/>
만약 Delegate 프로토콜을 구조체나 열거형도 채택할 수 있도록 AnyObject를 상속하지 않고 그냥 내버려 둔다면 DelegateObject가 구조체나 열거형으로 만들어질 수 있습니다. <br/>
이러면 SomeObject는 DelegateObject를 무조건 강한참조로 가지고 있을 수 밖에 없게 됩니다.(Delegate Object가 value type이므로 weak reference를 할 수 없게 됨) <br/>
이 때 반대로, DelegateObject가 SomeObject를 참조하지 않는다면 별 문제가 되지 않겠지만, 만약 프로퍼티나 지역변수로 SomeObject를 참조하게 된다면 `순환참조 문제`가 발생하게 됩니다. <br/>
이는 인스턴스가 메모리에서 해제되지 않는다는 것을 의미합니다. <br/>
(DelegateObject가 지역변수로 단순히 특정 메소드 내에서만 SomeObject를 의존한다고 하더라도 순환참조 문제는 발생할 수 있다고 생각합니다. 해당 지역변수가 어떻게 활용될지 모르니까요.) <br/>
이 이유때문에 Delegate Protocol이 AnyObject를 상속받았다고 생각합니다. 😆 <br/>
이렇게 함으로써 Delegate Object는 클래스(참조 타입)임이 보장되고, Object에서는 이 Delegate Object를 weak참조할 수 있게 되어 순환참조 문제를 미연에 방지할 수 있게 됩니다. <br/>
      - 관련 문서   https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
    </td>
  </tr>
</table>

&nbsp;

#### **ViewController가 DataSource나 Delegate를 선택적으로 채택하기 VS. TableViewController를 사용하기**

* TableViewController는 tableView 프로퍼티를 기본적으로 가지고 있으며 DataSource, Delegate 메소드에 대한 기본 구현이 제공되는 클래스이다. (따라서 원하는 기능을 제공하기 위해서는 해당 메소드들을 `override`해주어야 한다. )
* [Apple의 Tutorial](https://developer.apple.com/tutorials/app-dev-training/)에서는 대부분 TableViewController를 쓰지만 실제로 이 방식은 거의 사용하지 않는다.
  *  DataSource나 Delegate라는 책임에 대한 부분이 명시적으로 보이지 않아서 쓰지 않는 듯 하다. 
  *  TableViewController를 쓰는 경우 화면을 전부 TableView로만 채워야 하는 단점도 존재한다. 

&nbsp;

#### 기본 스타일 셀 VS. 커스텀 셀

<img src="https://user-images.githubusercontent.com/39452092/126276673-aec2cc26-29e8-4d46-957d-f1d966e3ee65.png" width=600 />

> https://developer.apple.com/documentation/uikit/uitableviewcell

<br/>

* **기본 스타일 셀**에는 `basic`, `right detail`, `left detail`, `subtitle`이 존재한다.

  |     스타일 이름      |                         스타일 예시                          |                             설명                             |
  | :------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
  |  <br /><br />Basic   | <img width="400" alt="basic" src="https://user-images.githubusercontent.com/39452092/126272451-c8dc0be3-7fa1-4d98-a0b1-90f718a931bd.png"> |    <br /><br />하나의 `ImageView`와 하나의 `Label`로 구성    |
  |  <br />Right Detail  | <img width="400" alt="right detail" src="https://user-images.githubusercontent.com/39452092/126273475-be214b85-61f1-4bf0-a496-58e2dcf547c3.png"> | <br />하나의 `ImageView`와 두개의 `Label`(Title, Detail)로 구성 |
  |  <br />Left Detail   | <img width="400" alt="left detail" src="https://user-images.githubusercontent.com/39452092/126273680-f2198398-f64b-4c3d-b4c9-9caccebfefe7.png"> |       <br /><br />두개의 `Label`(Title, Detail)로 구성       |
  | <br /><br />Subtitle | <img width="400" alt="subtitle" src="https://user-images.githubusercontent.com/39452092/126273758-16449a83-edf2-4708-8025-7d697d6870e7.png"> | <br />하나의 `ImageView`와 두개의 `Label`(Title, Detail)로 구성 |

  * Accessory View - 종류로는 `None`, `Disclosure Indicator`, `Detail Disclosure`, `Checkmark`, `Detail`이 있다. 셀을 누르거나 악세서리 뷰를 눌렀을 때 어떤 동작이 일어나게 될지 사용자에게 알리는 역할을 한다. (셀을 눌렀을때의 동작과 분리시켜서 별도의 동작이 일어나도록 만들 수 있다. ex- 설정 내 wifi, bluetooth)

    <img width="622" alt="accessory view" src="https://user-images.githubusercontent.com/39452092/126275798-f2d3d169-b5a7-4688-8adb-96b22653eb27.png">

&nbsp;

#### `Cell Reuse Queue`

* 셀은 **재사용**된다. 화면에서 사라진 셀은 다음에 나타날 셀을 표현하기 위해 재사용된다. (매번 이니셜라이징 되지 않음)
* 이는 퍼포먼스를 위한 것이다. (뷰를 매번 새롭게 만드는 것은 오버헤드가 크다.)

> **오버헤드**(overhead)는 어떤 처리를 하기 위해 들어가는 간접적인 처리 시간 · 메모리 등을 말한다. - [위키](https://ko.wikipedia.org/wiki/%EC%98%A4%EB%B2%84%ED%97%A4%EB%93%9C)

* TableViewDataSource의 `tableView(_:cellForRowAt:)`에서  `tableView`의 `dequeueReusableCell(withIdentifier:for:)`을 통해 재사용할 셀을 가져올 수 있다. 
* 재사용할 셀이 있다면 해당 셀을 가져다가 쓸 수 있으며, 여유 셀이 없는 경우 새로 만들게 된다. 

&nbsp;

#### **UIContentConfiguration**

- in `UITableViewCell`

  기본 제공 스타일로 UITableViewCell을 사용하고자 하는 경우 내부 컴포넌트들을 정의하는 방식이 iOS 14를 기준으로 바뀌었다. 이전에는 cell의 imageView 등의 프로퍼티에 바로 접근하여 세팅하는 방식이었다면 이제는 `defaultContentConfiguration()`을 사용해야 한다.

- zeddiOS 블로그 참고

  [iOS 14 ) Modern Cell Configuration (1)](https://zeddios.tistory.com/1205)

  [iOS 14 ) Modern Cell Configuration (2)](https://zeddios.tistory.com/1206)

&nbsp;

#### 뷰 컨트롤러간의 데이터 전달

<img src="https://user-images.githubusercontent.com/39452092/126315396-e941649a-f856-46ae-8a5b-8a95904302ba.gif" width=300 height=600 />

* 뷰 컨트롤러간 데이터를 전달하는 방법에는 [여러가지](https://i-colours-u.tistory.com/6)가 있다. 우리는 그 중 `segue를 이용한 방식`과 `TableViewDelegate 내에서 다음 VC를 instantiate하는 방식`을 고민했었다. 각 방식의 장점은 다음과 같다. 

  | 방식 이름                                   | 장점                                               |
  | :------------------------------------------ | :------------------------------------------------- |
  | segue(prepareFor)                           | 스토리보드에서 화면의 흐름을 알 수 있다            |
  | storyboard.instantiate in TableViewDelegate | 코드에서 흐름을 알 수 있다 <br />디버깅에 용이하다 |

  ➡️ 두 방식 모두 **스토리보드에 의존적**이다. 

&nbsp;

#### 제네릭과 메타타입

```swift
import UIKit

class ParsingManager {
    //MARK: Singleton Instance
    static let shared = ParsingManager()
    
    //MARK: Initializer
    private init() {}
}

//MARK:- Parse JSON
extension ParsingManager {
    func parse<T: Codable>(from fileName: String, to type: T.Type) -> Result<T, ParsingError> {
        guard let asset = NSDataAsset(name: fileName) else {
            return .failure(.dataSetNotFound)
        }
        guard let data = try? JSONDecoder().decode(type, from: asset.data) else {
            return .failure(.decodingFailed)
        }
        
        return .success(data)
    }
}
```

* 제네릭을 사용하면 ''정의한 요구사항에 따르는 모든 타입''에 대응되는 ''유연하고 재사용 가능한 함수 및 타입''을 작성할 수 있다. 

* 메타타입은 타입에 대한 타입이다. 메타타입의 인스턴스는 해당 타입 그 자체를 의미한다. 타입을 값처럼 표현할 수 있다. 

* 호출하는 곳에서는 `T`라는 타입이 무엇인지 알려주려면 최소한 T.Type은 넘겨줘야 한다.(또는 T 인스턴스를 넘겨서 인스턴스를 넘겨줌과 동시에 T 타입에 대해 알려줄 수도 있다.)

* T가 Codable을 준수하면 [T]도 Codable을 준수한다. 때문에 위의 `parse(from:to:)`메소드를 호출하는 곳에서는 메타타입 부분에 Array 메타타입을 넘겨줄 수도 있다.

  ```swift
  struct SomeModel: Codable {...}
  ParsingManager.shared.parse(from: "", to: SomeModel.self)
  ParsingManager.shared.parse(from: "", to: [SomeModel].self)
  ```

&nbsp;

#### Unit Test

* ViewController에 대한 Unit Test는 아키텍처에 따라 다를 수 있겠지만 MVC에서의 VC는 UnitTest보다는 UITest에 더 가깝다. (뷰의 라이프싸이클에 의존적이므로)
* Singleton Object는 별도의 변수에 할당하여 사용하지 않고 바로 사용하는 것이 일반적이다. 

<br/>

#### JSONDecoder의 `decode(_:from:)`는 json 파일만 파싱할 수 있는가?  

* [json 포맷도 사실은 텍스트를 기반으로 한 포맷이다.](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON)
* 결론부터 말하자면 JSON 형식에 맞춰서 작성되었다면 텍스트 파일이라고 하더라도 파싱이 가능하다. 
* **JSON 형식과 파일의 포맷(확장자) 및 인코딩방식 모두 중요하다.** 
  * JSON 형식에 관해 - 문법적인 부분이므로 당연히 맞춰주어야 한다. 
  * 파일의 포맷(확장자)에 관해 - Text Editor를 이용하여 만든 rtf파일은 파싱이 안되었다.(인코딩 방식을 UTF-8로 변경해봐도 안되었음)
  * 인코딩 방식에 대해 - 텍스트 파일이여도 인코딩 방식이 다른 경우 파싱이 되지 않았다.('한국어 MacOS' 인코딩 기준)

&nbsp;

## STEP3(일부)

### 📖 주요 학습 개념

#### 내비게이션 컨트롤러에서 특정 화면의 Orientation 고정하기

<img src="https://user-images.githubusercontent.com/39452092/126316479-558f9990-a7cf-4088-a4fb-a7c09bf8abd1.gif" width=300 height=600 />

⚠️ 첫번째 화면은 portrait로 고정이 되어있어서 애니메이션에 나타나지 않음 ⚠️
&nbsp;   

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller)

- **Handling View Rotations**부분에 대하여 

  - 방향에 대한 부분은 root VC만이 관리할 수 있다고 한다. 이 위에 쌓이는 VC들은 rootVC의 규칙을 따르는 것으로 보임(Navigation Controller를 사용하는 경우 root는 이 Navigation Controller가 됨)

  → 따라서 Navigation Controller에 쌓이는 VC들의 뷰 방향을 설정하려면 가장 먼저 내비게이션 컨트롤러의 뷰 방향 설정을 해줘야 함

[Disable Rotation of UIViewController Embedded Into UINavigationController - Apps Developer Blog](https://www.appsdeveloperblog.com/disable-rotation-of-uiviewcontroller-embedded-into-uinavigationcontroller/)

- 위 링크대로 해주면 첫번째 VC의 방향은 세로로 고정이 된다.
- 근데 아래쪽 Navigation Controller에 대한 extension 작성 시 왜 get으로 한번 더 감싸줬는지 모르겠다. 안써줘도 될텐데..
- Navigation Controller에 VC가 올라올 때마다 Navigation Controller extension의 세 개 연산 프로퍼티들이 호출?되는 것으로 보인다.

```swift
class Yagom {
    private(set) var age = 21
    
    func updateYagomAge(to age: Int) {
        if age <= 21 {
            self.age = age
        }
    }
}

class Yagom2 {
    private var _age = 21

    var age: Int {
        get {
            return self._age - 1     //미국식 나이로 알려주기
        }
        set {
            if newValue <= 21 {
                self.age = newValue
            }
        }
    }
}
```
   
- _~~위와같이 쓸거라면 get이 들어가는게 적절한데 위 링크에서는 왜 get을 넣었을까..~~_      
- `Yagom2` 클래스에  작성한 방식처럼 연산프로퍼티를 getter setter로써 쓴다면 get과 set이라는 것을 내부에서 나눠주는게 별로 이상하지 않은데, [링크](https://www.appsdeveloperblog.com/disable-rotation-of-uiviewcontroller-embedded-into-uinavigationcontroller/) 에서는 값을 얻어가는 부분만 있음에도 내부를 get으로 한번 더 감싼 부분이 이해가 가지 않았다.   
"위와같이(Yagom2 클래스의 `age` 연산 프로퍼티같이) 쓸거라면 get이 들어가는게 적절한데 왜 링크에서는 값을 얻는 부분만 있음에도 get을 넣었을까!" 실제로 get을 빼도 동작은 문제가 없었다.   
&nbsp;   
아래는 의문을 가진 부분에 대한 코드이다. 
```swift
extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
}
```
> https://www.appsdeveloperblog.com/disable-rotation-of-uiviewcontroller-embedded-into-uinavigationcontroller/

  <br/>

### 아니면 `UINavigationControllerDelegate`를 써볼 수도 있을 것 같다.

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontrollerdelegate/1621884-navigationcontrollersupportedint)

`supportedInterfaceOrientations`이 각각의 VC에서 설정하는 것이라면

`navigationControllerSupportedInterfaceOrientations(_:)`는 delegate가 한번에 설정해서 관리하는 것 같다.

```swift
import UIKit

//root view controller
class WorldsExpoViewController: UIViewController {
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }

//MARK:- Fix Orientation
extension WorldsExpoViewController: UINavigationControllerDelegate {
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        if navigationController.visibleViewController == self {
            return .portrait
        } else {
            return .all
        }
    }
}

//MARK:- Fix Orientation(수정한 버전)
extension WorldsExpoViewController: UINavigationControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return navigationController.visibleViewController?.supportedInterfaceOrientations ?? .all
    }
}
```

- 일단은 UINavigationControllerDelegate의 책임은 Root ViewController에 부여해주었다. 왜냐하면 Pop되지는 않을테니까. 뭔가 다른 좋은 방법이 있으려나 (일단 retain cycle은 미발생)

- 방향에 대한 protocol들을 만들어준 다음 모든 VC가 채택하게 하면 `navigationControllerSupportedInterfaceOrientations(_:)` 이 안에서는 조건문을 나누기가 편해지겠지? 프로토콜에 대한 것만 체크하면 될테니까.

  → 아니면 위의 수정한 버전처럼 해줘도 될 듯.(모든 VC가 각자의 `supportedInterfaceOrientations` 설정 필요. 설정 안해두면 기본값 사용)

- VC가 내비게이션 컨트롤러에 올라올 때마다 `navigationControllerSupportedInterfaceOrientations(_:)` 가 호출되는 것으로 보인다.
