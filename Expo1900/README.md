# ๐ ๋ง๊ตญ๋ฐ๋ํ ํ๋ก์ ํธ

**ํ๋ก์ ํธ ๊ธฐ๊ฐ: 2021๋ 7์ 5์ผ ~ 7์ 16์ผ**

*with Coden, Namu, Nala*

## Flow Chart

<img width="435" alt="๋ง๊ตญ๋ฐ๋ํ Flow Chart" src="https://user-images.githubusercontent.com/39452092/124571207-8c8b8280-de82-11eb-8945-15dffa4a23e8.png">
&nbsp;   

## UML - ์์  ์ 

<img width="707" alt="๋ง๊ตญ๋ฐ๋ํ UML ์์  ์ " src="https://user-images.githubusercontent.com/39452092/124571259-98774480-de82-11eb-8082-4a2292bc7084.png">

&nbsp;ย 

## UML - ์์  ํ

<img width="1141" alt="๋ง๊ตญ๋ฐ๋ํ UML ์์  ํ" src="https://user-images.githubusercontent.com/39452092/125980544-1402b47e-07a8-4ca0-9b7a-b1222e8bdf98.png">

&nbsp;

## STEP1 - Model ๊ตฌํ

### ๐ ์ฃผ์ ํ์ต ๊ฐ๋

#### `Codable`

- Codable์ด ์ ์ธ๋ ํํ

```swift
typealias Codable = Decodable & Encodable
```

- `Decodable` ๋๋ `Encodable` ๋ ์ค ํ๋์ ํ๋กํ ์ฝ๋ง ์ฑํํ๋ ๊ฒฝ์ฐ ํด๋น ํ์์ด ํน์  ๋ชฉ์ ์ผ๋ก๋ง ์ฌ์ฉ๋๋ค๋ ๊ฒ์ ๋ช์ํ  ์ ์๊ฒ ๋๋ค. (๋์ฝ๋ฉ ๋๋ ์ธ์ฝ๋ฉ ๋ชฉ์ ์ผ๋ก๋ง ์ฌ์ฉ๋๋ค!)
- `Codable`์ ์ฑํํ๋ ๊ฒฝ์ฐ ์ธ์ฝ๋ฉ๊ณผ ๋์ฝ๋ฉ์ด ๋ชจ๋ ๊ฐ๋ฅํ ์ํ๊ฐ ๋๋ค. 
- Codable์ **Struct๋ง ์ฑํ์ด ๊ฐ๋ฅํ ํ๋กํ ์ฝ**์ด๋ฉฐ **๊ตฌ์กฐ์ฒด ๋ด๋ถ์ ๋ชจ๋  ํ๋กํผํฐ๋ค์ด Codable์ ์ค์**ํ์ฌ์ผ๋ง ํ๋ค. 

&nbsp;ย 

#### `CodingKey`

* json์์์ ํค๊ฐ๊ณผ struct์ ํ๋กํผํฐ๋ช์ด ์ผ์นํ์ง ์๋ ๊ฒฝ์ฐ ์ ์ฉํ ํ๋กํ ์ฝ

* ์ด ํ๋กํ ์ฝ์ ์ฑํํ๋ enum์ ์ด๋ฆ์ `CodingKeys`๋ผ๊ณ  ํด์ผ ํ๋ค. 

  โก๏ธ ์ ์ด๋ฆ์ด `CodingKeys`์ด์ด์ผ ํ๋์ง์ ๋ํด ์๋ฌธ์ ๊ฐ์ก์๊ณ  ์ด์ ๋ํ ์๋ผ์ด ์ด๋ฃจ์ด์ก๋ [๋งํฌ](https://forums.swift.org/t/rename-encodable-codingkeys/30571/6)๋ฅผ ์ป์ ์ ์์๋ค. 

* CodingKeys๋ Codable struct์ Nested Type์ผ๋ก์จ UML์ ์์ฑํด์ฃผ์์๋๋ฐ ์ด๋ ์ ์ ์น ๋ชปํ๋ค๊ณ  ํ๋ค. Codable struct๊ฐ ์ด enum์ ์ด๋ค๊ธฐ๋ณด๋ค๋ Codable ์์ฒด์์ ์ฐ์ด๋ ๋ถ๋ถ์ด๋ผ์! โก๏ธ UML ์์ ์ ํ๋ฉด์ ์ญ์ 

&nbsp;

#### Contents.json

```swift
{
  "data" : [
    {
      "filename" : "๋ญ์๊ธฐ๋ญ์๊ธฐ.json",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

* Asset์ ๋ฐ์ดํฐ๋ฅผ ์ถ๊ฐํ๋ ๊ฒฝ์ฐ ์๋์ผ๋ก ์์ฑ๋๋ ํ์ผ
* ๋ฐ์ดํฐ์ ๋ํ ๋ฐ์ดํฐ, ๋ฉํ๋ฐ์ดํฐ ํ์ผ์ด๋ค. 
* ์ด ์น๊ตฌ๋ Model ํ์์ ๋ฐ๋ก ๋ง๋ค์ด์ค ํ์๊ฐ ์๋ค. 

<br/>

## STEP2 - TableView

<img src="https://user-images.githubusercontent.com/39452092/126313127-869f7e74-6d86-400f-afef-f16186d3b4a5.gif" width=300 height=600 />

<br/>

### ๐ ์ฃผ์ ํ์ต ๊ฐ๋

* Coden์ด ๊ทธ๋ ค๋ณธ Sequence Diagram

  <img src="https://user-images.githubusercontent.com/39452092/125982468-c6a08509-cd85-42e1-bce1-cccc01270419.png" width=700 />

&nbsp;

* Coden์ด ๊ทธ๋ ค๋ณธ Delegate์ ๋ํ Class Diagram

  <img src="https://user-images.githubusercontent.com/39452092/125983592-528a5d38-544b-4526-96a5-e2f4c570d4a9.png" width=800 />

  **`AnyObject`๊ฐ ์๋ ์ด์ **

<table>
  <tr>
    <td>
Protocol์ด AnyObject๋ฅผ ์์ํ๋ฉด ํด๋น ํ๋กํ ์ฝ์ ํด๋์ค๋ง ์ฑํํ  ์ ์๊ฒ ๋ฉ๋๋ค.<br/>
์ด๋ `Object์ DelegateObject๊ฐ ์ํ์ฐธ์กฐ`๊ฐ ๋ฐ์ํ๋ ๊ฒ์ ๋ง๊ธฐ์ํจ์๋๋ค. <br/>
์์ ์ ๊ฐ ๊ทธ๋ฆฐ UML์๋ ๋์์๋ฏ์ด SomeObject์ DelegateObject๋ ์ํ์ฐธ์กฐ๊ฐ ๋ฐ์ํ  ๊ฐ๋ฅ์ฑ์ด ์กด์ฌํฉ๋๋ค.(์๋ก๋ฅผ ์ฐธ์กฐํ๋ ํ์ดํ๊ฐ ์กด์ฌ) <br/>
๋ง์ฝ Delegate ํ๋กํ ์ฝ์ ๊ตฌ์กฐ์ฒด๋ ์ด๊ฑฐํ๋ ์ฑํํ  ์ ์๋๋ก AnyObject๋ฅผ ์์ํ์ง ์๊ณ  ๊ทธ๋ฅ ๋ด๋ฒ๋ ค ๋๋ค๋ฉด DelegateObject๊ฐ ๊ตฌ์กฐ์ฒด๋ ์ด๊ฑฐํ์ผ๋ก ๋ง๋ค์ด์ง ์ ์์ต๋๋ค. <br/>
์ด๋ฌ๋ฉด SomeObject๋ DelegateObject๋ฅผ ๋ฌด์กฐ๊ฑด ๊ฐํ์ฐธ์กฐ๋ก ๊ฐ์ง๊ณ  ์์ ์ ๋ฐ์ ์๊ฒ ๋ฉ๋๋ค.(Delegate Object๊ฐ value type์ด๋ฏ๋ก weak reference๋ฅผ ํ  ์ ์๊ฒ ๋จ) <br/>
์ด ๋ ๋ฐ๋๋ก, DelegateObject๊ฐ SomeObject๋ฅผ ์ฐธ์กฐํ์ง ์๋๋ค๋ฉด ๋ณ ๋ฌธ์ ๊ฐ ๋์ง ์๊ฒ ์ง๋ง, ๋ง์ฝ ํ๋กํผํฐ๋ ์ง์ญ๋ณ์๋ก SomeObject๋ฅผ ์ฐธ์กฐํ๊ฒ ๋๋ค๋ฉด `์ํ์ฐธ์กฐ ๋ฌธ์ `๊ฐ ๋ฐ์ํ๊ฒ ๋ฉ๋๋ค. <br/>
์ด๋ ์ธ์คํด์ค๊ฐ ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋์ง ์๋๋ค๋ ๊ฒ์ ์๋ฏธํฉ๋๋ค. <br/>
(DelegateObject๊ฐ ์ง์ญ๋ณ์๋ก ๋จ์ํ ํน์  ๋ฉ์๋ ๋ด์์๋ง SomeObject๋ฅผ ์์กดํ๋ค๊ณ  ํ๋๋ผ๋ ์ํ์ฐธ์กฐ ๋ฌธ์ ๋ ๋ฐ์ํ  ์ ์๋ค๊ณ  ์๊ฐํฉ๋๋ค. ํด๋น ์ง์ญ๋ณ์๊ฐ ์ด๋ป๊ฒ ํ์ฉ๋ ์ง ๋ชจ๋ฅด๋๊น์.) <br/>
์ด ์ด์ ๋๋ฌธ์ Delegate Protocol์ด AnyObject๋ฅผ ์์๋ฐ์๋ค๊ณ  ์๊ฐํฉ๋๋ค. ๐ <br/>
์ด๋ ๊ฒ ํจ์ผ๋ก์จ Delegate Object๋ ํด๋์ค(์ฐธ์กฐ ํ์)์์ด ๋ณด์ฅ๋๊ณ , Object์์๋ ์ด Delegate Object๋ฅผ weak์ฐธ์กฐํ  ์ ์๊ฒ ๋์ด ์ํ์ฐธ์กฐ ๋ฌธ์ ๋ฅผ ๋ฏธ์ฐ์ ๋ฐฉ์งํ  ์ ์๊ฒ ๋ฉ๋๋ค. <br/>
      - ๊ด๋ จ ๋ฌธ์   https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
    </td>
  </tr>
</table>

&nbsp;

#### **ViewController๊ฐ DataSource๋ Delegate๋ฅผ ์ ํ์ ์ผ๋ก ์ฑํํ๊ธฐ VS. TableViewController๋ฅผ ์ฌ์ฉํ๊ธฐ**

* TableViewController๋ tableView ํ๋กํผํฐ๋ฅผ ๊ธฐ๋ณธ์ ์ผ๋ก ๊ฐ์ง๊ณ  ์์ผ๋ฉฐ DataSource, Delegate ๋ฉ์๋์ ๋ํ ๊ธฐ๋ณธ ๊ตฌํ์ด ์ ๊ณต๋๋ ํด๋์ค์ด๋ค. (๋ฐ๋ผ์ ์ํ๋ ๊ธฐ๋ฅ์ ์ ๊ณตํ๊ธฐ ์ํด์๋ ํด๋น ๋ฉ์๋๋ค์ `override`ํด์ฃผ์ด์ผ ํ๋ค. )
* [Apple์ Tutorial](https://developer.apple.com/tutorials/app-dev-training/)์์๋ ๋๋ถ๋ถ TableViewController๋ฅผ ์ฐ์ง๋ง ์ค์ ๋ก ์ด ๋ฐฉ์์ ๊ฑฐ์ ์ฌ์ฉํ์ง ์๋๋ค.
  *  DataSource๋ Delegate๋ผ๋ ์ฑ์์ ๋ํ ๋ถ๋ถ์ด ๋ช์์ ์ผ๋ก ๋ณด์ด์ง ์์์ ์ฐ์ง ์๋ ๋ฏ ํ๋ค. 
  *  TableViewController๋ฅผ ์ฐ๋ ๊ฒฝ์ฐ ํ๋ฉด์ ์ ๋ถ TableView๋ก๋ง ์ฑ์์ผ ํ๋ ๋จ์ ๋ ์กด์ฌํ๋ค. 

&nbsp;

#### ๊ธฐ๋ณธ ์คํ์ผ ์ VS. ์ปค์คํ ์

<img src="https://user-images.githubusercontent.com/39452092/126276673-aec2cc26-29e8-4d46-957d-f1d966e3ee65.png" width=600 />

> https://developer.apple.com/documentation/uikit/uitableviewcell

<br/>

* **๊ธฐ๋ณธ ์คํ์ผ ์**์๋ `basic`, `right detail`, `left detail`, `subtitle`์ด ์กด์ฌํ๋ค.

  |     ์คํ์ผ ์ด๋ฆ      |                         ์คํ์ผ ์์                          |                             ์ค๋ช                             |
  | :------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
  |  <br /><br />Basic   | <img width="400" alt="basic" src="https://user-images.githubusercontent.com/39452092/126272451-c8dc0be3-7fa1-4d98-a0b1-90f718a931bd.png"> |    <br /><br />ํ๋์ `ImageView`์ ํ๋์ `Label`๋ก ๊ตฌ์ฑ    |
  |  <br />Right Detail  | <img width="400" alt="right detail" src="https://user-images.githubusercontent.com/39452092/126273475-be214b85-61f1-4bf0-a496-58e2dcf547c3.png"> | <br />ํ๋์ `ImageView`์ ๋๊ฐ์ `Label`(Title, Detail)๋ก ๊ตฌ์ฑ |
  |  <br />Left Detail   | <img width="400" alt="left detail" src="https://user-images.githubusercontent.com/39452092/126273680-f2198398-f64b-4c3d-b4c9-9caccebfefe7.png"> |       <br /><br />๋๊ฐ์ `Label`(Title, Detail)๋ก ๊ตฌ์ฑ       |
  | <br /><br />Subtitle | <img width="400" alt="subtitle" src="https://user-images.githubusercontent.com/39452092/126273758-16449a83-edf2-4708-8025-7d697d6870e7.png"> | <br />ํ๋์ `ImageView`์ ๋๊ฐ์ `Label`(Title, Detail)๋ก ๊ตฌ์ฑ |

  * Accessory View - ์ข๋ฅ๋ก๋ `None`, `Disclosure Indicator`, `Detail Disclosure`, `Checkmark`, `Detail`์ด ์๋ค. ์์ ๋๋ฅด๊ฑฐ๋ ์์ธ์๋ฆฌ ๋ทฐ๋ฅผ ๋๋ ์ ๋ ์ด๋ค ๋์์ด ์ผ์ด๋๊ฒ ๋ ์ง ์ฌ์ฉ์์๊ฒ ์๋ฆฌ๋ ์ญํ ์ ํ๋ค. (์์ ๋๋ ์๋์ ๋์๊ณผ ๋ถ๋ฆฌ์์ผ์ ๋ณ๋์ ๋์์ด ์ผ์ด๋๋๋ก ๋ง๋ค ์ ์๋ค. ex- ์ค์  ๋ด wifi, bluetooth)

    <img width="622" alt="accessory view" src="https://user-images.githubusercontent.com/39452092/126275798-f2d3d169-b5a7-4688-8adb-96b22653eb27.png">

&nbsp;

#### `Cell Reuse Queue`

* ์์ **์ฌ์ฌ์ฉ**๋๋ค. ํ๋ฉด์์ ์ฌ๋ผ์ง ์์ ๋ค์์ ๋ํ๋  ์์ ํํํ๊ธฐ ์ํด ์ฌ์ฌ์ฉ๋๋ค. (๋งค๋ฒ ์ด๋์๋ผ์ด์ง ๋์ง ์์)
* ์ด๋ ํผํฌ๋จผ์ค๋ฅผ ์ํ ๊ฒ์ด๋ค. (๋ทฐ๋ฅผ ๋งค๋ฒ ์๋กญ๊ฒ ๋ง๋๋ ๊ฒ์ ์ค๋ฒํค๋๊ฐ ํฌ๋ค.)

> **์ค๋ฒํค๋**(overhead)๋ ์ด๋ค ์ฒ๋ฆฌ๋ฅผ ํ๊ธฐ ์ํด ๋ค์ด๊ฐ๋ ๊ฐ์ ์ ์ธ ์ฒ๋ฆฌ ์๊ฐ ยท ๋ฉ๋ชจ๋ฆฌ ๋ฑ์ ๋งํ๋ค. - [์ํค](https://ko.wikipedia.org/wiki/%EC%98%A4%EB%B2%84%ED%97%A4%EB%93%9C)

* TableViewDataSource์ `tableView(_:cellForRowAt:)`์์  `tableView`์ `dequeueReusableCell(withIdentifier:for:)`์ ํตํด ์ฌ์ฌ์ฉํ  ์์ ๊ฐ์ ธ์ฌ ์ ์๋ค. 
* ์ฌ์ฌ์ฉํ  ์์ด ์๋ค๋ฉด ํด๋น ์์ ๊ฐ์ ธ๋ค๊ฐ ์ธ ์ ์์ผ๋ฉฐ, ์ฌ์  ์์ด ์๋ ๊ฒฝ์ฐ ์๋ก ๋ง๋ค๊ฒ ๋๋ค. 

&nbsp;

#### **UIContentConfiguration**

- in `UITableViewCell`

  ๊ธฐ๋ณธ ์ ๊ณต ์คํ์ผ๋ก UITableViewCell์ ์ฌ์ฉํ๊ณ ์ ํ๋ ๊ฒฝ์ฐ ๋ด๋ถ ์ปดํฌ๋ํธ๋ค์ ์ ์ํ๋ ๋ฐฉ์์ด iOS 14๋ฅผ ๊ธฐ์ค์ผ๋ก ๋ฐ๋์๋ค. ์ด์ ์๋ cell์ imageView ๋ฑ์ ํ๋กํผํฐ์ ๋ฐ๋ก ์ ๊ทผํ์ฌ ์ธํํ๋ ๋ฐฉ์์ด์๋ค๋ฉด ์ด์ ๋ `defaultContentConfiguration()`์ ์ฌ์ฉํด์ผ ํ๋ค.

- zeddiOS ๋ธ๋ก๊ทธ ์ฐธ๊ณ 

  [iOS 14 ) Modern Cell Configuration (1)](https://zeddios.tistory.com/1205)

  [iOS 14 ) Modern Cell Configuration (2)](https://zeddios.tistory.com/1206)

&nbsp;

#### ๋ทฐ ์ปจํธ๋กค๋ฌ๊ฐ์ ๋ฐ์ดํฐ ์ ๋ฌ

<img src="https://user-images.githubusercontent.com/39452092/126315396-e941649a-f856-46ae-8a5b-8a95904302ba.gif" width=300 height=600 />

* ๋ทฐ ์ปจํธ๋กค๋ฌ๊ฐ ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌํ๋ ๋ฐฉ๋ฒ์๋ [์ฌ๋ฌ๊ฐ์ง](https://i-colours-u.tistory.com/6)๊ฐ ์๋ค. ์ฐ๋ฆฌ๋ ๊ทธ ์ค `segue๋ฅผ ์ด์ฉํ ๋ฐฉ์`๊ณผ `TableViewDelegate ๋ด์์ ๋ค์ VC๋ฅผ instantiateํ๋ ๋ฐฉ์`์ ๊ณ ๋ฏผํ์๋ค. ๊ฐ ๋ฐฉ์์ ์ฅ์ ์ ๋ค์๊ณผ ๊ฐ๋ค. 

  | ๋ฐฉ์ ์ด๋ฆ                                   | ์ฅ์                                                |
  | :------------------------------------------ | :------------------------------------------------- |
  | segue(prepareFor)                           | ์คํ ๋ฆฌ๋ณด๋์์ ํ๋ฉด์ ํ๋ฆ์ ์ ์ ์๋ค            |
  | storyboard.instantiate in TableViewDelegate | ์ฝ๋์์ ํ๋ฆ์ ์ ์ ์๋ค <br />๋๋ฒ๊น์ ์ฉ์ดํ๋ค |

  โก๏ธ ๋ ๋ฐฉ์ ๋ชจ๋ **์คํ ๋ฆฌ๋ณด๋์ ์์กด์ **์ด๋ค. 

&nbsp;

#### ์ ๋ค๋ฆญ๊ณผ ๋ฉํํ์

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

* ์ ๋ค๋ฆญ์ ์ฌ์ฉํ๋ฉด ''์ ์ํ ์๊ตฌ์ฌํญ์ ๋ฐ๋ฅด๋ ๋ชจ๋  ํ์''์ ๋์๋๋ ''์ ์ฐํ๊ณ  ์ฌ์ฌ์ฉ ๊ฐ๋ฅํ ํจ์ ๋ฐ ํ์''์ ์์ฑํ  ์ ์๋ค. 

* ๋ฉํํ์์ ํ์์ ๋ํ ํ์์ด๋ค. ๋ฉํํ์์ ์ธ์คํด์ค๋ ํด๋น ํ์ ๊ทธ ์์ฒด๋ฅผ ์๋ฏธํ๋ค. ํ์์ ๊ฐ์ฒ๋ผ ํํํ  ์ ์๋ค. 

* ํธ์ถํ๋ ๊ณณ์์๋ `T`๋ผ๋ ํ์์ด ๋ฌด์์ธ์ง ์๋ ค์ฃผ๋ ค๋ฉด ์ต์ํ T.Type์ ๋๊ฒจ์ค์ผ ํ๋ค.(๋๋ T ์ธ์คํด์ค๋ฅผ ๋๊ฒจ์ ์ธ์คํด์ค๋ฅผ ๋๊ฒจ์ค๊ณผ ๋์์ T ํ์์ ๋ํด ์๋ ค์ค ์๋ ์๋ค.)

* T๊ฐ Codable์ ์ค์ํ๋ฉด [T]๋ Codable์ ์ค์ํ๋ค. ๋๋ฌธ์ ์์ `parse(from:to:)`๋ฉ์๋๋ฅผ ํธ์ถํ๋ ๊ณณ์์๋ ๋ฉํํ์ ๋ถ๋ถ์ Array ๋ฉํํ์์ ๋๊ฒจ์ค ์๋ ์๋ค.

  ```swift
  struct SomeModel: Codable {...}
  ParsingManager.shared.parse(from: "", to: SomeModel.self)
  ParsingManager.shared.parse(from: "", to: [SomeModel].self)
  ```

&nbsp;

#### Unit Test

* ViewController์ ๋ํ Unit Test๋ ์ํคํ์ฒ์ ๋ฐ๋ผ ๋ค๋ฅผ ์ ์๊ฒ ์ง๋ง MVC์์์ VC๋ UnitTest๋ณด๋ค๋ UITest์ ๋ ๊ฐ๊น๋ค. (๋ทฐ์ ๋ผ์ดํ์ธ์ดํด์ ์์กด์ ์ด๋ฏ๋ก)
* Singleton Object๋ ๋ณ๋์ ๋ณ์์ ํ ๋นํ์ฌ ์ฌ์ฉํ์ง ์๊ณ  ๋ฐ๋ก ์ฌ์ฉํ๋ ๊ฒ์ด ์ผ๋ฐ์ ์ด๋ค. 

<br/>

#### JSONDecoder์ `decode(_:from:)`๋ json ํ์ผ๋ง ํ์ฑํ  ์ ์๋๊ฐ?  

* [json ํฌ๋งท๋ ์ฌ์ค์ ํ์คํธ๋ฅผ ๊ธฐ๋ฐ์ผ๋ก ํ ํฌ๋งท์ด๋ค.](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON)
* ๊ฒฐ๋ก ๋ถํฐ ๋งํ์๋ฉด JSON ํ์์ ๋ง์ถฐ์ ์์ฑ๋์๋ค๋ฉด ํ์คํธ ํ์ผ์ด๋ผ๊ณ  ํ๋๋ผ๋ ํ์ฑ์ด ๊ฐ๋ฅํ๋ค. 
* **JSON ํ์๊ณผ ํ์ผ์ ํฌ๋งท(ํ์ฅ์) ๋ฐ ์ธ์ฝ๋ฉ๋ฐฉ์ ๋ชจ๋ ์ค์ํ๋ค.** 
  * JSON ํ์์ ๊ดํด - ๋ฌธ๋ฒ์ ์ธ ๋ถ๋ถ์ด๋ฏ๋ก ๋น์ฐํ ๋ง์ถฐ์ฃผ์ด์ผ ํ๋ค. 
  * ํ์ผ์ ํฌ๋งท(ํ์ฅ์)์ ๊ดํด - Text Editor๋ฅผ ์ด์ฉํ์ฌ ๋ง๋  rtfํ์ผ์ ํ์ฑ์ด ์๋์๋ค.(์ธ์ฝ๋ฉ ๋ฐฉ์์ UTF-8๋ก ๋ณ๊ฒฝํด๋ด๋ ์๋์์)
  * ์ธ์ฝ๋ฉ ๋ฐฉ์์ ๋ํด - ํ์คํธ ํ์ผ์ด์ฌ๋ ์ธ์ฝ๋ฉ ๋ฐฉ์์ด ๋ค๋ฅธ ๊ฒฝ์ฐ ํ์ฑ์ด ๋์ง ์์๋ค.('ํ๊ตญ์ด MacOS' ์ธ์ฝ๋ฉ ๊ธฐ์ค)

&nbsp;

## STEP3(์ผ๋ถ)

### ๐ ์ฃผ์ ํ์ต ๊ฐ๋

#### ๋ด๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ์์ ํน์  ํ๋ฉด์ Orientation ๊ณ ์ ํ๊ธฐ

<img src="https://user-images.githubusercontent.com/39452092/126316479-558f9990-a7cf-4088-a4fb-a7c09bf8abd1.gif" width=300 height=600 />

โ ๏ธ ์ฒซ๋ฒ์งธ ํ๋ฉด์ portrait๋ก ๊ณ ์ ์ด ๋์ด์์ด์ ์ ๋๋ฉ์ด์์ ๋ํ๋์ง ์์ โ ๏ธ
&nbsp;   

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller)

- **Handling View Rotations**๋ถ๋ถ์ ๋ํ์ฌ 

  - ๋ฐฉํฅ์ ๋ํ ๋ถ๋ถ์ root VC๋ง์ด ๊ด๋ฆฌํ  ์ ์๋ค๊ณ  ํ๋ค. ์ด ์์ ์์ด๋ VC๋ค์ rootVC์ ๊ท์น์ ๋ฐ๋ฅด๋ ๊ฒ์ผ๋ก ๋ณด์(Navigation Controller๋ฅผ ์ฌ์ฉํ๋ ๊ฒฝ์ฐ root๋ ์ด Navigation Controller๊ฐ ๋จ)

  โ ๋ฐ๋ผ์ Navigation Controller์ ์์ด๋ VC๋ค์ ๋ทฐ ๋ฐฉํฅ์ ์ค์ ํ๋ ค๋ฉด ๊ฐ์ฅ ๋จผ์  ๋ด๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ์ ๋ทฐ ๋ฐฉํฅ ์ค์ ์ ํด์ค์ผ ํจ

[Disable Rotation of UIViewController Embedded Into UINavigationController - Apps Developer Blog](https://www.appsdeveloperblog.com/disable-rotation-of-uiviewcontroller-embedded-into-uinavigationcontroller/)

- ์ ๋งํฌ๋๋ก ํด์ฃผ๋ฉด ์ฒซ๋ฒ์งธ VC์ ๋ฐฉํฅ์ ์ธ๋ก๋ก ๊ณ ์ ์ด ๋๋ค.
- ๊ทผ๋ฐ ์๋์ชฝ Navigation Controller์ ๋ํ extension ์์ฑ ์ ์ get์ผ๋ก ํ๋ฒ ๋ ๊ฐ์ธ์คฌ๋์ง ๋ชจ๋ฅด๊ฒ ๋ค. ์์จ์ค๋ ๋ ํ๋ฐ..
- Navigation Controller์ VC๊ฐ ์ฌ๋ผ์ฌ ๋๋ง๋ค Navigation Controller extension์ ์ธ ๊ฐ ์ฐ์ฐ ํ๋กํผํฐ๋ค์ด ํธ์ถ?๋๋ ๊ฒ์ผ๋ก ๋ณด์ธ๋ค.

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
            return self._age - 1     //๋ฏธ๊ตญ์ ๋์ด๋ก ์๋ ค์ฃผ๊ธฐ
        }
        set {
            if newValue <= 21 {
                self.age = newValue
            }
        }
    }
}
```
   
- _~~์์๊ฐ์ด ์ธ๊ฑฐ๋ผ๋ฉด get์ด ๋ค์ด๊ฐ๋๊ฒ ์ ์ ํ๋ฐ ์ ๋งํฌ์์๋ ์ get์ ๋ฃ์์๊น..~~_      
- `Yagom2` ํด๋์ค์  ์์ฑํ ๋ฐฉ์์ฒ๋ผ ์ฐ์ฐํ๋กํผํฐ๋ฅผ getter setter๋ก์จ ์ด๋ค๋ฉด get๊ณผ set์ด๋ผ๋ ๊ฒ์ ๋ด๋ถ์์ ๋๋ ์ฃผ๋๊ฒ ๋ณ๋ก ์ด์ํ์ง ์์๋ฐ, [๋งํฌ](https://www.appsdeveloperblog.com/disable-rotation-of-uiviewcontroller-embedded-into-uinavigationcontroller/) ์์๋ ๊ฐ์ ์ป์ด๊ฐ๋ ๋ถ๋ถ๋ง ์์์๋ ๋ด๋ถ๋ฅผ get์ผ๋ก ํ๋ฒ ๋ ๊ฐ์ผ ๋ถ๋ถ์ด ์ดํด๊ฐ ๊ฐ์ง ์์๋ค.   
"์์๊ฐ์ด(Yagom2 ํด๋์ค์ `age` ์ฐ์ฐ ํ๋กํผํฐ๊ฐ์ด) ์ธ๊ฑฐ๋ผ๋ฉด get์ด ๋ค์ด๊ฐ๋๊ฒ ์ ์ ํ๋ฐ ์ ๋งํฌ์์๋ ๊ฐ์ ์ป๋ ๋ถ๋ถ๋ง ์์์๋ get์ ๋ฃ์์๊น!" ์ค์ ๋ก get์ ๋นผ๋ ๋์์ ๋ฌธ์ ๊ฐ ์์๋ค.   
&nbsp;   
์๋๋ ์๋ฌธ์ ๊ฐ์ง ๋ถ๋ถ์ ๋ํ ์ฝ๋์ด๋ค. 
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

### ์๋๋ฉด `UINavigationControllerDelegate`๋ฅผ ์จ๋ณผ ์๋ ์์ ๊ฒ ๊ฐ๋ค.

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontrollerdelegate/1621884-navigationcontrollersupportedint)

`supportedInterfaceOrientations`์ด ๊ฐ๊ฐ์ VC์์ ์ค์ ํ๋ ๊ฒ์ด๋ผ๋ฉด

`navigationControllerSupportedInterfaceOrientations(_:)`๋ delegate๊ฐ ํ๋ฒ์ ์ค์ ํด์ ๊ด๋ฆฌํ๋ ๊ฒ ๊ฐ๋ค.

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

//MARK:- Fix Orientation(์์ ํ ๋ฒ์ )
extension WorldsExpoViewController: UINavigationControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return navigationController.visibleViewController?.supportedInterfaceOrientations ?? .all
    }
}
```

- ์ผ๋จ์ UINavigationControllerDelegate์ ์ฑ์์ Root ViewController์ ๋ถ์ฌํด์ฃผ์๋ค. ์๋ํ๋ฉด Pop๋์ง๋ ์์ํ๋๊น. ๋ญ๊ฐ ๋ค๋ฅธ ์ข์ ๋ฐฉ๋ฒ์ด ์์ผ๋ ค๋ (์ผ๋จ retain cycle์ ๋ฏธ๋ฐ์)

- ๋ฐฉํฅ์ ๋ํ protocol๋ค์ ๋ง๋ค์ด์ค ๋ค์ ๋ชจ๋  VC๊ฐ ์ฑํํ๊ฒ ํ๋ฉด `navigationControllerSupportedInterfaceOrientations(_:)` ์ด ์์์๋ ์กฐ๊ฑด๋ฌธ์ ๋๋๊ธฐ๊ฐ ํธํด์ง๊ฒ ์ง? ํ๋กํ ์ฝ์ ๋ํ ๊ฒ๋ง ์ฒดํฌํ๋ฉด ๋ ํ๋๊น.

  โ ์๋๋ฉด ์์ ์์ ํ ๋ฒ์ ์ฒ๋ผ ํด์ค๋ ๋  ๋ฏ.(๋ชจ๋  VC๊ฐ ๊ฐ์์ `supportedInterfaceOrientations` ์ค์  ํ์. ์ค์  ์ํด๋๋ฉด ๊ธฐ๋ณธ๊ฐ ์ฌ์ฉ)

- VC๊ฐ ๋ด๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ์ ์ฌ๋ผ์ฌ ๋๋ง๋ค `navigationControllerSupportedInterfaceOrientations(_:)` ๊ฐ ํธ์ถ๋๋ ๊ฒ์ผ๋ก ๋ณด์ธ๋ค.
