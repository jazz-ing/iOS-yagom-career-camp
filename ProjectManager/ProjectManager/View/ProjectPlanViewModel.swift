//
//  ProjectPlanViewModel.swift
//  ProjectManager
//
//  Created by 이윤주 on 2021/11/03.
//

import SwiftUI

final class ProjectPlanViewModel: ObservableObject {
    @Published private var model = ProjectPlanList(plans: DummyData().data)
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    var plans: Array<Plan> {
        model.plans
    }

    func add(title: String, description: String, deadline: Date) {
        model.add(title: title, description: description, deadline: deadline)
    }
    
    func edit(_ planID: UUID, title: String, description: String, deadline: Date) {
        model.edit(planID, title: title, description: description, deadline: deadline)
    }
    
    func delete(at indexSet: IndexSet) {
        model.delete(at: indexSet)
    }
    
    func change(_ plan: Plan, to state: Plan.State) {
        model.change(plan, to: state)
    }
    
    func isOverdue(_ plan: Plan) -> Bool {
        let current = Date()
        let calendar = Calendar.current
        if calendar.compare(current, to: plan.deadline, toGranularity: .day) == .orderedDescending {
            return true
        }
        return false
    }
    
    func format(date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    func number(of state: String) -> Int {
        plans.filter({ $0.state.description == state }).count
    }
}
