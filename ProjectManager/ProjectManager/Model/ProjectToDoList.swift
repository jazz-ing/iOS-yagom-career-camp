//
//  ProjectToDoList.swift
//  ProjectManager
//
//  Created by 이윤주 on 2021/11/03.
//

import Foundation

struct ProjectToDoList {
    private(set) var plans: Array<Plan>
    
    mutating func add(title: String, description: String, deadline: Date) {
        let newPlan = Plan(state: .toDo, title: title, description: description, deadline: deadline)
        plans.append(newPlan)
    }
    
    mutating func edit(_ plan: Plan, title: String, description: String, deadline: Date) {
        if let index = plans.firstIndex(where: { $0.id == plan.id }) {
            plans[index].title = title
            plans[index].description = description
            plans[index].deadline = deadline
        }
    }
    
    mutating func delete(at indexSet: IndexSet) {
        plans.remove(atOffsets: indexSet)
    }
    
    mutating func change(_ plan: Plan, to state: Plan.State) {
        if let index = plans.firstIndex(where: { $0.id == plan.id }) {
            plans[index].state = state
        }
    }
    
    mutating func checkDeadline(_ plan: Plan) -> Bool {
        guard let index = plans.firstIndex(where: { $0.id == plan.id }) else { return false }
        let current = Date()
        let calendar = Calendar.current
        if calendar.compare(current, to: plans[index].deadline, toGranularity: .day) == .orderedDescending {
            plans[index].isOverdue = true
        }
        return plans[index].isOverdue
        return true
    }
    
    struct Plan: Identifiable {
        enum State: String, CaseIterable {
            case toDo = "TODO"
            case doing = "DOING"
            case done = "DONE"
            
            var description: String {
                return self.rawValue
            }
        }
        
        var state: State
        var title: String
        var description: String
        var deadline: Date
        var isOverdue: Bool = false
        var id = UUID()
    }
}
