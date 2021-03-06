//
//  EditModalView.swift
//  ProjectManager
//
//  Created by 이윤주 on 2021/11/03.
//

import SwiftUI

struct EditModalView: View {
    enum EditType {
        case add
        case edit
    }
    
    let plan: Plan
    let editType: EditType
    @Binding var showsAddView: Bool
    @ObservedObject var viewModel: ProjectPlanViewModel
    @State private var isEditable = true
    @State private var title = ""
    @State private var deadline = Date()
    @State private var description = """
    기분 좋은 하루 보내고 있나요?
    할 일을 입력해주세요.
    """
    
    init(plan: Plan?, editType: EditType, showsAddView: Binding<Bool>, viewModel: ProjectPlanViewModel) {
        if let plan = plan {
            self.plan = plan
            _isEditable = State(initialValue: false)
            _title = State(initialValue: plan.title)
            _deadline = State(initialValue: plan.deadline)
            _description = State(initialValue: plan.description)
        } else {
            self.plan = Plan(state: .toDo, title: "", description: "", deadline: Date())
        }
        self.editType = editType
        _showsAddView = showsAddView
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                titleTextField
                datePicker
                descriptionTextEditor
                Spacer()
            }
            .disabled(!isEditable)
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    cancelButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    switch editType {
                    case .add:
                        doneButton
                    case .edit:
                        editButton
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

extension EditModalView {
    private var titleTextField: some View {
        TextField("Title", text: $title)
            .padding()
            .textFieldStyle(.roundedBorder)
    }
    
    private var datePicker: some View {
        DatePicker("", selection: $deadline)
            .datePickerStyle(.wheel)
            .fixedSize()
    }
    
    private var descriptionTextEditor: some View {
        TextEditor(text: $description)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(.systemGray5), lineWidth: 1.0)
                    .padding(.horizontal)
            )
    }
    
    private var cancelButton: some View {
        Button("Cancel") {
            self.showsAddView = false
        }
    }
    
    private var doneButton: some View {
        Button("Done") {
            viewModel.add(title: title,
                          description: description,
                          deadline: deadline)
            self.showsAddView = false
        }
    }
    
    private var editButton: some View {
        Button {
            if isEditable {
                viewModel.edit(plan.id,
                               title: title,
                               description: description,
                               deadline: deadline)
                self.showsAddView = false
            } else {
                self.isEditable.toggle()
            }
        } label: {
            isEditable ? Text("Done") : Text("Edit")
        }
    }
}

struct EditModalView_Previews: PreviewProvider {
    static var previews: some View {
        EditModalView(plan: Plan(state: .toDo,
                                 title: "마라탕 먹기",
                                 description: "마라탕 먹으러가야지",
                                 deadline: Date()),
                    editType: .add,
                    showsAddView: .constant(true),
                    viewModel: ProjectPlanViewModel()
        )
    }
}
