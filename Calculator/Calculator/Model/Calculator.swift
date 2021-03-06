import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case invalidNumber
    case invalidOperator
    case noResult
    
    var errorMessage: String {
        switch self {
        case .dividedByZero:
            return "NaN"
        default:
            return "Error발생"
        }
    }
}

class Calculator {
    private var infix: [String] = []
    private var postfix: [String] = []
    private var numberStack = Stack<String>()
    private var operatorsStack = Stack<String>()
    
    func changeToPostfix(from infix: Array<String>) {
        infix.forEach {
            if isOperator(item: $0) {
                addToPostfix(item: $0)
            } else if operatorsStack.isEmpty() {
                addToOperatorStack(item: $0)
            } else {
                comparePriority(with: changeOperatorType($0))
            }
        }
        processLeftOperatorStack()
    }
    
    private func isOperator(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        return !operators.contains(item)
    }
    
    private func addToOperatorStack(item: String) {
        operatorsStack.push(item: item)
    }
    
    private func addToPostfix(item: String) {
        postfix.append(item)
    }
    
    private func comparePriority(with input: Operator?) {
        guard let unwrappedLastOperator = operatorsStack.top() else { return }
        let lastOfOperatorStack = changeOperatorType(unwrappedLastOperator)
        guard let unwrappedLastOfOperatorStack = lastOfOperatorStack, let unwrappedInput = input else { return }
        if unwrappedLastOfOperatorStack < unwrappedInput {
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else if unwrappedLastOfOperatorStack == unwrappedInput {
            addToPostfix(item: unwrappedLastOfOperatorStack.operatorSymbol)
            operatorsStack.pop()
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else {
            processLeftOperatorStack()
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        }
    }
    
    private func changeOperatorType(_ item: String) -> Operator? {
        let lastStackOperator = item
        
        switch lastStackOperator {
        case "+":
            return Operator.plus
        case "−":
            return Operator.minus
        case "×":
            return Operator.multiply
        case "÷":
            return Operator.divide
        default:
            return nil
        }
    }
    
    private func checkDividedNumber(second: Double) throws {
        let invalidNumber = Double(0)
        guard second != invalidNumber else {
            throw CalculatorError.dividedByZero
        }
    }
    
    private func determineCalculationWay(first: String, second: String, arithmethicOperator: String) throws -> Double {
        guard let first = Double(first) , let second = Double(second) else {
            throw CalculatorError.invalidNumber
        }
        switch arithmethicOperator {
        case "+":
            return second + first
        case "−":
            return second - first
        case "×":
            return second * first
        case "÷":
            try checkDividedNumber(second: first)
            return second / first
        default:
            throw CalculatorError.invalidOperator
        }
    }
    
    private func processLeftOperatorStack() {
        while !operatorsStack.isEmpty() {
            guard let leftItem = operatorsStack.pop() else {
                return
            }
            postfix.append(leftItem)
        }
    }
    
    private func checkInteger(number: String?) throws -> Bool {
        guard let unwrappedNumber = number else {
            throw CalculatorError.noResult
        }
        return unwrappedNumber.split(separator: ".").last.map{ String($0) } == "0"
    }
    
    private func roundDown(number: String?, decimalPlace: Int) throws -> String? {
        guard let unwrappedNumber = number, let convertedNumber = Double(unwrappedNumber) else {
            throw CalculatorError.invalidNumber
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = decimalPlace
        let roundDownResult = numberFormatter.string(for: convertedNumber)
        return roundDownResult
    }
    
    private func calculatePostfix() throws -> String? {
        for item in postfix {
            if isOperator(item: item) {
                numberStack.push(item: item)
            } else {
                guard let first = numberStack.pop(), let second = numberStack.pop() else {
                    throw CalculatorError.invalidNumber
                }
                let calculateResult = try determineCalculationWay(first: first, second: second, arithmethicOperator: item)
                numberStack.push(item: String(calculateResult))
            }
        }
        return numberStack.pop()
    }
    
    func returnCalculationResult() throws -> String? {
        do {
            let calculateResult = try calculatePostfix()
            if try checkInteger(number: calculateResult) {
                return try roundDown(number: calculateResult, decimalPlace: 0)
            }
            return calculateResult
        } catch CalculatorError.dividedByZero {
            return CalculatorError.dividedByZero.errorMessage
        } 
    }
}
