//
//  PersonEditorView.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct PersonEditorView: View {

    @EnvironmentObject var state: AppState
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var group = 0
    @State var showingAddGroupSheet = false
    @State var notes = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        Text("Name")
                        TextField("John Smith", text: $name)
                    }
                    Picker(selection: $group, label: Text("Group")) {
                        ForEach(0..<self.state.groups.count, id: \.self) { index in
                            Text(self.state.groups[index].name).tag(index)
                        }
                    }
                    HStack {
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
                        Button(action: {
                            self.showingAddGroupSheet.toggle()
                        }) {
                            Text("Add Group")
                        }.sheet(isPresented: self.$showingAddGroupSheet) {
                            AddGroupView(createdGroupIndex: self.$group).environmentObject(self.state)
                        }
                    }
                    HStack {
                        Text("Notes")
                        TextField("What a cool guy!", text: $notes)
                        // TODO: this currently has no effect so there is no way to create a multiline TextField in SwiftUI (except wrapping a UITextView)
                        .lineLimit(nil)
                    }
                }
            }
            .navigationBarTitle(self.name)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }, trailing: Button(action: {
                    let group = self.state.groups[self.group]
                    let person = Person(id: UUID(), name: self.name, notes: self.notes)
                    self.state.addPerson(person, into: group.id)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                })
        }

    }
}

struct PersonEditorView_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditorView().environmentObject(AppState())
    }
}
