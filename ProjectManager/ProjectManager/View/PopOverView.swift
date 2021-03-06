//
//  PopOverView.swift
//  ProjectManager
//
//  Created by 이윤주 on 2021/11/06.
//

import SwiftUI

struct PopOverView: View {
    let plan: Plan
    @ObservedObject var viewModel: ProjectPlanViewModel
    
    var body: some View {
        VStack {
            moveToDoing
            moveToDone
        }
        .padding()
        .background(Color(red: 228 / 255, green: 230 / 255, blue: 235 / 255))
    }
}

extension PopOverView {
    private var moveToDoing: some View {
        Button("Move to DOING") {
            viewModel.change(plan, to: .doing)
        }
        .padding(.horizontal, 30.0)
        .padding(.vertical, 15.0)
        .background(Color.white)
    }
    
    private var moveToDone: some View {
        Button("Move to DONE") {
            viewModel.change(plan, to: .done)
        }
        .padding(.horizontal, 33.0)
        .padding(.vertical, 15.0)
        .background(Color.white)
    }

}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView(plan: Plan(state: .toDo, title: "a", description: "b", deadline: Date()), viewModel: ProjectPlanViewModel())
    }
} 
