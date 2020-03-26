//
//  AddPersonEditorView.swift
//  Netwerk
//
//  Created by James Macindoe on 23/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct AddPersonView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var personState = AddPersonState()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            PersonView(name: personState.nameBinding,
                       groupIndex: personState.groupIndexBinding,
                       notes: personState.notesBinding)
                .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }, trailing: Button(action: {
                        self.savePersonToAppState()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                    })
        }
    }

    func savePersonToAppState() {
        let group = self.appState.groups[self.personState.groupIndex]
        let person = Person(id: UUID(), name: self.personState.name, notes: self.personState.notes)
        self.appState.addPerson(person, into: group.id)
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
