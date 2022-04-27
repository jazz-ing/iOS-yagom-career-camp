//
//  QueueMethodTest.swift
//  QueueMethodTest
//
//  Created by 이윤주 on 2021/07/28.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueMethodTest: XCTestCase {
    func test_testQueue에_1을추가했을때_Queue의첫번째값이1이다() {
        //given
        var testQueue = Queue<Int>()
        
        //when
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        let outputValue = testQueue.peek() ?? .zero
        let expectedResult = 1
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_비어있는Queue를_isEmpty메소드로확인했을때_결과값이true가나온다() {
        //given
        var testQueue = Queue<Int>()
        
        //when
        let outputValue = testQueue.isEmpty()
        let expectedResult = true
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_값이있는Queue를_isEmpty메소드로확인했을때_결과값이false가나온다() {
        // given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        
        //when
        let outputValue = testQueue.isEmpty()
        let expectedResult = false
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_Queue에1과2를넣고_dequeu메소드사용시_Queue의가장첫번째값은2가된다() {
        //given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        
        //when
        testQueue.dequeue()
        let outputValue = testQueue.peek() ?? .zero
        let expectedResult = 2
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_Queue에1과2를넣고_clear메소드사용시_Queue의모든값이사라진다() {
        //given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        
        //when
        testQueue.clear()
        let outputValue = testQueue.isEmpty()
        let expectedValue = true
        
        //then
        XCTAssertEqual(outputValue, expectedValue)
    }
    
    func test_Queue에1과2를넣고_peek메소드사용시_맨앞의값인1이나온다() {
        //given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        
        //when
        let outputValue = testQueue.peek()
        let expectedValue = 1
        
        //then
        XCTAssertEqual(outputValue, expectedValue)
    }
}
