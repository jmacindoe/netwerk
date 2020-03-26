//
//  PersonView.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

/// Don't use directly. Use AddPersonView or EditPersonView instead.
struct PersonView: View {
    @EnvironmentObject var appState: AppState
    @Binding var name: String
    @Binding var groupIndex: Int
    @Binding var notes: String

    var body: some View {
        VStack {
            Form {
                NameFieldView(name: self.$name)
                GroupPickerView(groupIndex: self.$groupIndex, groups: self.appState.groups)
                AddGroupButton(groupIndex: self.$groupIndex)
                NotesFieldView(notes: self.$notes)
            }
        }
        .navigationBarTitle(self.name)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: Binding.constant("Name"),
                   groupIndex: Binding.constant(0),
                   notes: Binding.constant("Notes..."))
            .environmentObject(AppState())
    }
}
