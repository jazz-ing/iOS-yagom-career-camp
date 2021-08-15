#### iOS 커리어 스타터 캠프

# 💷 은행창구 매니저 프로젝트
**프로젝트 기간: 2021.07.26~2021.08.06**
**팀원: Tacocat(Ldoy), Nala(jazz-ing)**


# UML
![128471314-305aab36-1177-4223-8d66-5622939f216a](https://user-images.githubusercontent.com/78457093/129442356-5d906e3c-723e-4dd2-9d73-397562e78c00.png)


# STEP1 - Linked List로 Queue 구현하기
## 📝 학습 내용
### Linked-list 자료구조의 이해 및 구현
#### Linked-list
- Node와 Reference로 구성된 데이터가 일렬로 연결되어 있는 선형 자료구조
#### Linked-list 코드 구현
<details>
<summary>구현 코드</summary>
<div markdown="1">  

```swift=
class Node<Value> {
    //MARK: Properties
    var value: Value
    var next: Node? = nil
    
    init(value: Value) {
        self.value = value
    }
    
    init(value: Value, next: Node?) {
        self.value = value
        self.next = next
    }
}

//MARK:-Node Print Method
extension Node {
    func printNodes() -> String {
        return "\(value) -> \(String(describing: next))"
    }
}

struct LinkedList<Value> {
    //MARK: Properties
    private var head: Node<Value>?
    private var tail: Node<Value>?
}

//MARK:- Node Manage Method
extension LinkedList {
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func append(_ value: Value) {
        if isEmpty() {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func remove() -> Value? {
        defer { head = head?.next }
        return head?.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    func glance() -> Value? {
        return head?.value
    }
}
``````

</div>
</details>

- Generic 활용
    - `LinkedList`타입 구현에 Generic을 사용하여 모든 타입에 활용할 수 있도록 하였다.
- Reference Count를 고려한 LinkedList 타입설계
    - 코드의 가독성을 위해 `head`와 `tail` node를 따로 명명하였다.
        - `head`는 첫 노드의 인스턴스, `tail`은 마지막 노드의 인스턴스
    - `head = nil`로 마지막 노드를 제외한 모든 노드의 인스턴스를 제거해 해제해주었다.
        - `head`를 nil로 만드는 경우, `head`의 next로 참조되고 있던 노드가 삭제되는 것이 연쇄적으로 일어나며 마지막 노드를 제외한 모든 노드가 해제된다.
    - 마지막 노드의 경우, tail 에 대한 참조를 이전 노드 뿐 아니라 Queue 의 linkedList 인스턴스도 가지고 있기 때문에 tail 인스턴스가 남게 된다. 따라서, `tail = nil`로 추가적으로 제거해 해제해주었다.

### Queue의 구현과 활용
#### Queue
- 먼저 넣은 데이터가 먼저 나오는 FIFO형태
- 배열, 연결리스트로 구현 가능한 추상적인 자료구조
#### Queue 코드 구현
<details>
<summary>구현 코드</summary>
<div markdown="1">  

```swift=
struct Queue<Value> {
    //MARK: Properties
    private var linkedList = LinkedList<Value>()
}

//MARK:-Queue Manage Method
extension Queue {
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enqueue(_ value: Value) {
        linkedList.append(value)
    }
    
    mutating func dequeue() -> Value? {
        return linkedList.remove()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    mutating func peek() -> Value? {
        return linkedList.glance()
    }
}
```
</div>
</details>


## 🤔 step1에서 고민했던 점
1️⃣ **단일 연결리스트, 이중 연결리스트**
- 단일 연결리스트로 Queue를 구현
    - 은행 대기열에 고객이 차례대로 들어오고 나가는 것으로, 한 방향으로 자료가 삽입되고 방출되는 경우이므로 단일 연결리스트를 사용하는 게 더 적절하다고 판단하였다.
    
2️⃣ **Node, Linked-list, Queue의 구현 타입**
- Node: `class`로 구현
    - 클래스를 이용하면 하나의 노드(head)를 참조하게 되고 이 head에 연결된 노드들에 대해 참조할 수 있게 된다.
    - 참조카운트를 사용해 LinkedList 와 Queue 의 삭제 메서드를 구현하고 있기 때문에 클래스로 구현한 형태가 적절하다고 판단했다.
-  Linked-list, Queue: `struct`로 구현
    - 상속, 참조 등 클래스의 특징을 사용하지 않고 있어 `struct`로 구현하였다.
    
3️⃣ **Node의 Memory Leak에 관하여**
- Queue 구조체를 만들 때 `Queue`가 가진 모든 `Node` 클래스 인스턴스를 없애는 `clear`메소드를 구현했어야 했다. 이 과정에서 `Node`의 `head`와 `tail`을 모두 `nil` 로 할당해야만 하는가에 대한 고민이 있었다. 
    - 결론 : 두 개의 `Node`(`head`, `tail`)에 모두 `nil`을 할당해야한다. `head`만 `nil`로 할당하는 경우 `tail`의 deinit 이 실행되지 않음을 콘솔로 확인하였다. 
    - 만약 tail을 nil로 할당하지 않는다면 동작에 이상은 없겠지만 앱 종료시까지 메모리에서 해제되지 않는 tail들이 쌓이게 되고 이는 메모리 누수(Memory leak)를 발생시킨다. 





# STEP2 - Queue 활용 및 타입 구현
## 📝학습내용
### 타입 추상화 및 일반화 
(1) Struct 와 class의 선택 기준 
- 기본적으로 선택하는 타입 : Struct(애플공식문서 )
    - 이유 : Struct타입의 객체는 컴파일 시기에 static allocation 형태로 할당되기에 빠른 실행이 가능하다. 또한 Struct의 메소드의 경우 Static Dispatch 방법으로 빠른 실행이 이루어진다. 
    - 하지만 구조체로 타입을 구현하는 경우 내부에 클래스타입의 속성을 가지며, 그 구조체인스턴스가 여러개 생기는 경우 Struct 타입은 지양해야한다. 
        - 이유 : 구조체는 stack에서 값 자체가 그대로 복사되는데 구조체가 가진 클래스타입의 속성 또한 그대로 복사된다. 이 때 해당 클래스타입의 속성이 가리키고 있는 Heap영역의 인스턴스를 가리키는 포인터도 복사되며 Reference Count가 증가한다.
        - 따라서 클래스 타입의 속성을 가지고 있고 인스턴스가 여러개 만들어지는 경우 클래스로 구현하는 것이 좋다. 
    참고 링크 : https://swiftrocks.com/memory-management-and-performance-of-value-types
  
(2)Queue의 활용
- 은행에 방문하는 고객의 대기열을 생성하는데에 Queue를 활용
    - 기존 Queue의 Node의 Value 를 Int가 아닌 고객 타입의 `Customer`로 두고 활용 


## 🤔 step2에서 고민했던 점
1️⃣**타입 안에 속성과 메소드를 선언하는 기준에 관하여**
- Bank 타입안에 clerk속성을 가지도록 하는 방향과 clerk 자체를 매게변수로 받는 방향 중 어느 것이 적합한지에 대한 고민이 있었다. 
- 결론
    - 속성 : 타입이 해당 속성을 자신의 특징, 성질로 가질 때
    - 메소드 : 타입의 행동을 구현할 때
    
2️⃣**현재 사용하지 않는 속성에 관하여**
- 은행원 한 명당 처리할 수 있는 속성에 관하여 미리 구현해 두어야 할지에 대한 고민
- 결론
    - 타입을 구현하는 프로그래머의 입장에서는 해당 속성이 어떤 의미를 가지고 있는지 알고 있지만 해당 코드를 읽는 다른 개발자(예를들어 팀원)의 입장에선 혼란을 야기할 수 있다. 따라서 해당 타입을 기존 feature에 merge 하기 전에 문서화 주석을 통해 기록 해당 속성에 대해 기록을 한 후 merge 할 땐 속성을 지우고 진행한다. 

3️⃣ **SOLID원칙에 따른 타입 구현에 관하여**
- `SRP`: 하나의 타입은 하나의 역할만 하도록 구현하려고 하였다. 이를 위해 Bank, BankClerk, BankManager, Customer의 타입으로 나누어 구현 
- `DIP`: Initializer를 통해 `의존성 주입` 의 방법으로 DIP를 지키려 하였다. 
    ```swift=
        // 기존 코드 예시
        struct Bank {
            let bankClerk = BankClerk()
        }
        
        // DIP를 위한 의존성 주입
        struct Bank {
            let bankClerk: BankClerk
            
            init(bankClerk: BankClerk) {
                self.bankClerk = bankClerk
            }
        }
    ```
4️⃣ **Customer의 수를 정해는 것은 누구의 역할인가?**
- Customer에 고객의 수를 정해주는 속성을 만들면 타입을 단일책임원칙에 위배됨. 
    - 이유 : Customer를 구현한 이유는 고객 자체에 대한 타입을 구현하기 위함인데 그 안에 Cutomer의 수를 정해주는 메서드가 들어가는건 하나의 책임을 지는 것이 아님
    - 결론 : BnakManager의 역할





# STEP3 - DispatchQueue를 이용한 동시성 프로그래밍
## 📝 학습내용 
<details>
<summary>동시성 프로그래밍이란?</summary>
<div markdown="1">  

### 동시성 프로그래밍이란?
1. 개념 : 여러개의 스레드 객체를 만들어 일을 동시에 처리하는 프로그래밍
- 비동기(Asynchronous)
    - 작업을 코드를 통해서 대기열로 보낸다. 그리고 기다리지 않고 다음 task를 처리 하는것

- 동기(Synchronous)
    - 작업을 시키고 일이 다 끝날때 까지 기다리는 개념

- iOS에서의 동시성 프로그래밍
    - 소프트웨어가 직접적으로 스레드를 관리하는 개념이 아닌 대기열의 개념을 이용해서 iOS가 작업을 분산처리하도록 하는 것 
    - 작업들을 Queue(대기행렬)에 보내기만 하면 iOS가 알아서 여러 쓰레드로 나눠서 ~~분산처리~~(`동시적처리`)를 한다. (즉 대기열에만 보내면 알아서 처리해 줌)
    - 메인쓰레드 외의 다른쓰레드에 알아서 분배하면서 task 를 동시적으로 처리함
    - 즉 iOS가 작업을 분산처리 할 수 있도록 Queue에 작업들을 모아두는데 iOS에서는 이 큐들을 GCD, Operation Queue라고 한다. 

2. iOS에서 동시성 프로그래밍을 위해 사용하는 Thread 대기열,GCD와 Operation Queue
- GCD
    - GCD : Grand Central DispatchQueue
    - 3가지 종류가 있다. DispatchQueue.main, DispatchQueue.global(), DispatchQueue(label:"...")

        - DispatchQueue.main
            - main Thread 혹은 main Queue라고 불린다. 
        - DispatchQueue.global()
            - QoS에 따라 6가지 종류로 나뉨
            - 기본적으로 Concurrent Queue로 동작한다. 즉 여러개의 thread를 사용하는 형태
            - QoS : Quality of Service, 큐마다 사용하는 스레드의 개수로 일의 처리능력을 나타내는 것. QoS로 작업의 우선순위를 정하여 더 빨리 끝내게 할 수 있다. 
                - .userInteractive, .userInitiated, .default, .utility, .boackground, .unspecified
        - DispatchQueue(label:"...")
            - 기본적으로 직렬큐로 만들어진다. (변경가능)
            - 작업의 순서가 중요할 때 해당 큐를 주로 사용한다. 
</div>
</details>

<details>
<summary>Tread란? </summary>
<div markdown="1"> 

### Tread란?
1) Physical Thread 
- 실제 CPU에 있는 Thread.
- 8코어 16스레드라는 것은 실제 스레드가 16개 있다는 것 
2) Sofeware Thread
- 물리적 스레드는 1초에 30억번 일을하고 있음
    - 하지만 실제 앱에서 필요한 동작은 그렇게 빠를 필요가 없음
- 물리적 스레드하나당 여러개의 스레드객체로 나눠도 속도가 느려지거나 그런 것 없이 효율적으로 자원분배 가능
    - thread pool
    - 물리적 스레드가 16개라고 하더라고 소프트웨어 스레드는 그 이상으로 만들고 없앨 수 있다. 즉 실제로는 아주 여러개 생성한다
- **소프트웨어적 스레드는 이 os가 관리하는 `Thread pool`에있는 스레드를 썼다가 없앴다가하는 형식으로 이루어진다**
    - 앱 단위에서 다루는 스레드는 소프트웨어적인 스레드(NSThread객체)이다.

    - <details>
           <summary>물리적 스레드와 소프트웨어 스레드는 어떻게 연결이되는가</summary>
           <div markdown="1"> 
        - 물리적 스레드는 실제 cpu에 있는 스레드의 개수 그대로
        - 8코어 16스레드면 실제 스레드는 16개가 있는 것, 하지만  os 영역에서 `NSThread`라는 객체를 만들어냄
        - 실제 물리적 스레드가 하나라고 하더라도 이 물리적 스레드에는 객체가 여러개 연결 될 수 있다
        
        > 닥터스트레인지 영화에서 주인공 스트레인지는 자신의 손을 고치기 위해 카르마타지로 마지막 여행을 떠난다. 
    내가 스트레인져처럼 `카마르타지(iOS)`에 10개의 일을 맡긴다고 해보자
    나는 이 일을 의뢰할 때 이 일은 `닥터스트레인져`가 해결해야해! 라고 얘기하거나(그동안 동시적 처리 안하고 메인큐에서 진행한 상황들), `다른 마법사들`도 같이 일을 할 수 있어! 라고 할 수 있다.(여기서 닥터스트레인지와 다른마법사들은 `물리적 쓰레드`)
    자 그럼 닥터스트레인지 입장에선 카르마타지에 의해 일을 받았으니 `처리` 하기만 하면 된다. 
    닥터스트레인지와 친구들은 `분신술`을 할 수 있기 때문에 본체만 일을하도록 하는게 아니라 여러개의 `분신(NSThread)`을 만들어서 의뢰한 일을 처리한다. 
    나는 그저 일의 우선순위와 상황에 따라 의뢰방향만 맞게 설정해 주고 카르마타지의 `의뢰접수처(Queue)`에 접수해 주면된다. 
    친구들과 같이 할 지 구분만 해 주면되고(DispatchQueue.global, 등의 옵션들) 나머지는 닥터스트레인지에게 맡기면 된다. </div>
    </details>
</div>
</details>

### (1) Semaphore
- 은행원 한 명은 고객 한 명의 업무를 처리하게 되는데, 동시에 여러명의 은행원이 업무를 처리할 수 있다. 해당 기능을 구현하기 위해 동시에 실행되는 비동기 작업의 개수를 제한하고자 Semaphore를 활용하였다.
- Thread의 개수를 제한하는 데 OperationQueue의 기능을 활용할 수도 있으나, DispatchQueue를 활용해보고자 Semaphore를 선택해 구현해보았다.
- 세마포어는 사용 가능한 리소스의 수를 지정해줄 수 있다. `DispatchSemaphore(value: 2)`와 같이 이 값을 활용해 업무를 처리할 은행원의 수를 제한해주었다.
### (2) DispatchGroup
```swift=
func letClerkWork(_ loanWorkTime: Double) {
    let loanGroup = DispatchGroup()
    let loanQueue = DispatchQueue(label: "loanQueue")
    
    while waitingLine.isEmpty() == false {
        loanGroup.enter()
        loanQueue.async {
            self.bankClerk.work(for: currentCustomer, during: loanWorkTime)
            loanGroup.leave()
        }
    }
    
    loanGroup.notify(queue: loanQueue) {
        self.notifyClosing(totalCustomer: loanCustomerNubmer + depositCustomerNumber, totalTime: "10")
    }
}
```
- 은행원의 업무처리인 비동기 작업이 모두 끝난 후, 업무 마감 메소드를 실행시켜주기 위해 DispatchGroup을 활용했다.
- `enter()`메소드를 통해 비동기작업의 시작을 알리고, 실질적으로 종료되는 순간에 동작이 완전히 끝나고 난뒤 `leave()`메소드를 실행해주었다.
- 마지막으로 `notify()`메소드를 통해 그룹이 끝났음을 알려주며, 특정 그룹의 모든 작업 완료 시점에 업무 마감 메소드를 실행해주었다.


## 🤔 Step3에서 고민했던 점

#### 1️⃣ 동시성 프로그래밍을 활용한 Bank, BankClerk 타입 설계에 관하여 
- Step2에서는 예금상담을 하는 은행원의 수를 제한하였다. 하지만 Step3에서는 업무를 처리하는 은행원의 수가 업무마다 달랐다. 이를 위해 BankClerk의 명수를 'thread'로 생각하고 한 번에 task를 실행 할 수 있는 수를 제한하기 위해 DispatchSemaphore의 값을 2로 구현


## 😂 해결하지 못한 문제

### 1. Bank타입에서 비동기처리 메서드 구현 시 생긴 문제 

- Stuct타입이었던 Bank내부에 비동기적인 메소드 구현 시 생긴 문제
![](https://i.imgur.com/8t6VePB.png)
    - 오류의 이유 
    > 이스케이핑 클로저는 값타입의 변경 가능한 참조(mutating) 를 암시적으로 캡처할 수 없으며 값타입에서 사용하는 이스케이핑 클로저는 내부 값을 변경할 수 없다
    - 해결방법 : capturelist를 사용한다
        - `[self] in` 추가 

### 2. main 함수 내부 로직 구현 시 생긴 문제 
- `loanQueue`와 `depositQueue`가 모두 실행이 끝났을 때 `bankManager.start()`의 실행이 완료되도록 로직을 구현하지 못했었다. 이로 인해 `main` 함수 내부에서 `bankManager.start()`가 끝나기 전에 while문이 반복되는 문제가 발생하였다.
- DispatchGroup에 `wait()`메서드를 활용해 `bankManager.start()`가 종료되어야 다음 실행으로 넘어가도록 처리해주어 해당 문제를 해결하였다. 그러나 이렇게 할 경우, 비동기 처리가 되지 않는 문제가 발생하는데 이를 해결하지 못하였다.
- 해당 문제를 해결하자 업무 마감을 알리는 `notifyClosing()`이 `takeAnswer`보다 나중에 실행되는 문제가 발생하였다. 이전에는 `loanGroup.notify()`메소드를 통해 DispatchGroup의 실행 종료 시점에 `notifyClosing()`메서드를 실행하는 방식으로 구현하였으나 `notifyClosing()`메서드를 `loanGroup.notify()`를 활용하지 않고 `BankManager`의 `start()` 메서드로 옮겨주어 해결하였다.
    
    
 
#### 참고사항
**Step2 UML**

![은행창구매니저UML](https://user-images.githubusercontent.com/34529917/128467556-38ed7eee-2dca-433d-84af-cad2a6054f1d.png)
