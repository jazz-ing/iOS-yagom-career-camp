# ๐ป ์ผ๊ณฐ iOS ์ปค๋ฆฌ์ด ์คํํฐ ์บ ํ ํ๋ก์ ํธ

6๊ฐ์๊ฐ ์บ ํ์์ ์งํํ ํ๋ก์ ํธ๋ค์ ์ต์ ์์ผ๋ก ๋ชจ์๋์ ๋ ํฌ์งํ ๋ฆฌ์๋๋ค :)  

<br>

### ๋ชฉ์ฐจ

[๐ ํ๋ก์ ํธ ๊ด๋ฆฌ ์ฑ](#ํ๋ก์ ํธ-๊ด๋ฆฌ-์ฑ) - SwiftUI  

[โ๏ธ ๋ ์จ ์ ๋ณด](#๋ ์จ-์ ๋ณด)  - Open API ํ์ฉ   

[๐ ์คํ ๋ง์ผ](#์คํ-๋ง์ผ)  - ์๋ฒ์ ๋คํธ์ํน  

[๐ฆ ์ํ ์ฐฝ๊ตฌ ๋งค๋์ ](#์ํ-์ฐฝ๊ตฌ-๋งค๋์ )  - GCD  

[๐ ๋ง๊ตญ๋ฐ๋ํ](#๋ง๊ตญ๋ฐ๋ํ)  - UITableView, JSON  

[๐งฎ ๊ณ์ฐ๊ธฐ](#๊ณ์ฐ๊ธฐ)  - Stack  

[๐ฅค ์ฅฌ์ค ๋ฉ์ด์ปค](#์ฅฌ์ค-๋ฉ์ด์ปค)  - Notification Center  

[โ ๊ฐ์๋ฐ์๋ณด ๊ฒ์](#๊ฐ์๋ฐ์๋ณด-๊ฒ์)  - Enum, ์กฐ๊ฑด๋ฌธ  

[โพ๏ธ ์ซ์ ์ผ๊ตฌ](#์ซ์-์ผ๊ตฌ)  - Swift ๊ธฐ๋ณธ ๋ฌธ๋ฒ  

<br>

<br>

## ํ๋ก์ ํธ ๊ด๋ฆฌ ์ฑ

SwiftUI๋ก ๊ตฌํํ ํ  ์ผ ๊ด๋ฆฌ ์ฑ (SwiftUI, MVVM)  [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="600" src="https://user-images.githubusercontent.com/78457093/166190503-79c3591c-d8ac-421f-ac9e-a16dcbb8ed0a.gif">

๐ ๊ธฐ๊ฐ: 2021.10.25 ~ 11.19

๐ ํต์ฌ ๊ฒฝํ
  - SwiftUI๋ฅผ ํตํ UI๊ตฌํ
    - List, Pickers
    - Property Wrapper
  - MVVM์ผ๋ก ํ๋ก์ ํธ ์ค๊ณ
  - ๋ก์ปฌ๊ณผ ๋ฆฌ๋ชจํธ์ ๋ฐ์ดํฐ ๋๊ธฐํ ๋ฐ ๋ก์ปฌ ๋ฐ์ดํฐ ์ ์ฅ์ ๊ดํ ๊ธฐ์  ์คํ ์ ์ 

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/ProjectManager)

<br>

## ๋ ์จ ์ ๋ณด

๋ ์จ Open API๋ฅผ ํ์ฉํด ๋ฐ์ดํฐ๋ฅผ Table View์ ๋ณด์ฌ์ฃผ๋ ๋ ์จ ์ฑ (UIKit, MVC) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="260" src="https://user-images.githubusercontent.com/78457093/166190992-d92f3a1b-843c-4e13-bb87-2ddb348eada6.gif">

๐ ๊ธฐ๊ฐ: 2021.9.27 ~ 10.22  

๐ ํต์ฌ ๊ฒฝํ
  - TableView Header View ๊ตฌํ
  - Core Location์ ํ์ฉํ ์ขํ ํ์ฉ
  - Refresh Control์ ํ์ฉํ ๋น๊ฒจ์ ์๋ก๊ณ ์นจ ๊ธฐ๋ฅ ๊ตฌํ

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/WeatherForecast)

<br>

## ์คํ ๋ง์ผ 

์ค์  ์๋ฒ์์ ๋ฐ์ดํฐ๋ฅผ GETํด์ Collection View์ ๋ณด์ฌ์ฃผ๋ ๋ง์ผ ์ฑ (UIKit, MVC)  [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="260" src="https://user-images.githubusercontent.com/78457093/166191341-cdeed9c3-b0e2-401a-8057-c48a21fc66d6.gif">

๐ ๊ธฐ๊ฐ: 2021.8.9 ~ 9.17  

๐ ํต์ฌ ๊ฒฝํ
  - ๋คํธ์ํน ํ์ ๊ตฌํ
  - ๋คํธ์ํฌ์ ๋ฌด๊ดํ Unit Test
  - UICollectionView

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/OpenMarket)

<br> 

## ์ํ ์ฐฝ๊ตฌ ๋งค๋์ 

์๊ธ ์ฐฝ๊ตฌ 2๊ฐ, ๋์ถ ์ฐฝ๊ตฌ 1๊ฐ์์ 10~30๋ช์ ๊ณ ๊ฐ ์๋ฌด๋ฅผ ์ฒ๋ฆฌํ๋ ์ฝ์ ์ฑ (Console App) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img widht="500" src="https://user-images.githubusercontent.com/78457093/166191970-1a564adb-7a6a-4489-81cd-c137cf88412f.gif">

๐ ๊ธฐ๊ฐ: 2021.7.26 ~ 8.6  

๐ ํต์ฌ ๊ฒฝํ
  - Thread์ ์ดํด
  - GCD๋ฅผ ํ์ฉํ ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ
  - Generic์ ํ์ฉํ Queue ์๋ฃ๊ตฌ์กฐ ๊ตฌํ

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/BankManager)

<br>

## ๋ง๊ตญ๋ฐ๋ํ

๋ฐ๋ํ ์ถํ์ JSON ํ์ผ์ ๋ฐ์ดํฐ๋ฅผ ํ์ฑํด Table View์ ๋ณด์ฌ์ฃผ๋ ์ฑ (UIKit, MVC) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="260" src="https://user-images.githubusercontent.com/78457093/166190539-03a163c7-2b8e-4200-86c7-500ab9021820.gif">

๐ ๊ธฐ๊ฐ: 2021.7.5 ~ 7.16  

๐ ํต์ฌ ๊ฒฝํ
  - UITableView, UIScrollView
  - Auto Layout
  - JSON

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/Expo1900)

<br>

## ๊ณ์ฐ๊ธฐ

์ค์์ฐ์ฐ ์๋ ฅ์ ํ์์ฐ์ฐ์ผ๋ก ๋ณํํ๋ ๊ณ์ฐ๊ธฐ ์ฑ ๋ง๋ค๊ธฐ (UIKit, MVC) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

๐ ๊ธฐ๊ฐ: 2021.6.21 ~ 7.2

๐ ํต์ฌ ๊ฒฝํ
  - Generic์ ํ์ฉํ Stack ์๋ฃ๊ตฌ์กฐ ๊ตฌํ
  - Error Handling
  - Unit test

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/Calculator)

<br>

## ์ฅฌ์ค ๋ฉ์ด์ปค

์ฅฌ์ค ์ฃผ๋ฌธ๊ณผ ์ฌ๊ณ  ๊ด๋ฆฌ (UIKit, MVC) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="500" src="https://user-images.githubusercontent.com/52592748/130000242-dffc3306-651d-4d41-a096-872e5aa23f62.gif">

๐ ๊ธฐ๊ฐ: 2021.6.7 ~ 6.18

๐ ํต์ฌ ๊ฒฝํ
  - ๊ฐ์ฒด์งํฅ ํ๋ก๊ทธ๋๋ฐ
  - Delegation, Notification Center๋ฅผ ํ์ฉํ ํ๋ฉด๊ฐ ๋ฐ์ดํฐ ์ ๋ฌ
  - Modality, Stepper ํ์ฉ

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/JuiceMaker)

<br>

## ๊ฐ์๋ฐ์๋ณด ๊ฒ์

์ปดํจํฐ์ ์งํํ๋ ๊ฐ์๋ฐ์๋ณด ๊ฒ์ (Console app) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="500" src="https://user-images.githubusercontent.com/78457093/166190517-609ebca3-fd9c-4ac7-ac3a-06f649a4cbcc.gif">

๐ ๊ธฐ๊ฐ: 2021.5.31 ~ 6.4

๐ ํต์ฌ ๊ฒฝํ
  - Enum๊ณผ Enum์ rawValue, Type ํ์ฉ
  - if, switch, guard ๊ตฌ๋ฌธ ํ์ฉ

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/RockPaperScissors)

<br>

## ์ซ์ ์ผ๊ตฌ

์ปดํจํฐ์์ ์์ฑํ ๋๋ค ๋ฒํธ๋ก ์ซ์ ์ผ๊ตฌ ๊ฒ์ ์งํ (Console app) [*๋ชฉ์ฐจ๋ก ์ด๋*](#๋ชฉ์ฐจ)

<img width="500" src="https://user-images.githubusercontent.com/78457093/166190513-64f42278-3adf-4db1-af67-2a006f41d414.gif">

๐ ๊ธฐ๊ฐ: 2021.5.25 ~ 5.28

๐ ํต์ฌ ๊ฒฝํ
  - Swift ๊ธฐ์ด ๋ฌธ๋ฒ, Optional binding
  - Git ๊ธฐ๋ณธ ์ฌ์ฉ

๐ [ํ๋ก์ ํธ๋ก ์ด๋](https://github.com/jazz-ing/iOS-yagom-career-camp/tree/main/NumberBaseball)
